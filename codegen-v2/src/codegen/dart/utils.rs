use convert_case::{Case, Casing};
use heck::ToLowerCamelCase;
use crate::codegen::dart::{DartImport, DartOperation, DartType};
use crate::manifest::{ParamInfo, TypeInfo, TypeVariant};

pub fn pretty_name(name: &str) -> String {
    name.replace("_", "").replace("TW", "").replace("Proto", "")
}

pub fn pretty_name_without_prefix(name: &str, prefix: &str) -> String {
    name
        .strip_prefix(prefix)
        // Panicking implies bug, checked at the start of the loop.
        .unwrap()
        .to_lower_camel_case()
}
pub fn pretty_func_name(name: &str, object_name: &str) -> String {
    let pretty_name = pretty_name_without_prefix(name, object_name);

    if object_name == "TWStoredKey" {
        pretty_name
            .replace("Json", "JSON")
            .replace("Hd", "HD")
    } else if object_name == "TWPublicKey" {
        pretty_name
            .replace("Der", "DER")
    } else if object_name == "TWHash" {
        pretty_name
            .replace("ripemd", "RIPEMD")
            .replace("Ripemd", "RIPEMD")
            .replace("sha512256", "sha512_256")
            .replace("sha3256", "sha3_256")
            .replace("sha256sha256", "sha256SHA256")
    } else if object_name == "TWAES" {
        pretty_name
            .replace("Cbc", "CBC")
            .replace("Ctr", "CTR")
    } else {
        pretty_name
    }
}

pub fn pretty_file_name(name: &str) -> String {
    let new_name = name
        .replace("+", "_")
        .replace("TW", "")
        .replace("Proto", "");

    new_name.to_case(Case::Snake)
}

pub fn import_name(name: &str) -> String {
    format!("import 'package:{}.dart';", pretty_file_name(name))
}

pub fn has_address_protocol(name: &str) -> bool {
    pretty_name(name).ends_with("Address")
}

pub fn get_import_from_param(param: &ParamInfo) -> Option<DartImport> {
    match &param.ty.variant {
        TypeVariant::Struct(name) => {
            let import = import_name(name);
            Some(DartImport(import))
        }
        TypeVariant::Enum(name) => {
            let enum_name = format!("enums/{}", name);
            let import = import_name(enum_name.as_str());
            Some(DartImport(import))
        }
        _ => None,
    }
}

// Convenience function: process the parameter, returning the operation for
// handling the C FFI call (if any).
pub fn param_c_ffi_call(param: &ParamInfo) -> Option<DartOperation> {
    let op = match &param.ty.variant {
        // E.g. `final param = TWStringCreateWithNSString(param);`
        TypeVariant::String => {
            let (var_name, call) = (
                param.name.clone(),
                format!("TWStringCreateWithNSString({})", param.name),
            );

            // If the parameter is nullable, add special handler.
            if param.ty.is_nullable {
                DartOperation::CallOptional {
                    var_name,
                    var_type: "Pointer<Void>".to_string(),
                    call,
                }
            } else {
                DartOperation::Call {
                    var_name,
                    call,
                    is_ffi_call: true,
                }
            }
        }
        TypeVariant::Data => {
            let (var_name, call) = (
                param.name.clone(),
                format!("TWDataCreateWithNSData({})", param.name),
            );

            // If the parameter is nullable, add special handler.
            if param.ty.is_nullable {
                DartOperation::CallOptional {
                    var_name,
                    var_type: "Pointer<Void>".to_string(),
                    call,
                }
            } else {
                DartOperation::Call {
                    var_name,
                    call,
                    is_ffi_call: true,
                }
            }
        }
        // E.g.
        // - `final param = param.rawValue;`
        // - `final param = param?.rawValue;`
        TypeVariant::Struct(_) => {
            // For nullable structs, we do not use the special
            // `CallOptional` handler but rather use the question mark
            // operator.
            let (var_name, call) = if param.ty.is_nullable {
                (
                    param.name.clone(),
                    format!("{}?.rawValue", param.name),
                )
            } else {
                (
                    param.name.clone(),
                    format!("{}.rawValue", param.name)
                )
            };

            DartOperation::Call {
                var_name,
                call,
                is_ffi_call: false,
            }
        }
        // E.g. `final param = TWSomeEnum.fromValue(param.value);`
        // Note that it calls the constructor of the enum, which calls
        // the underlying "*Create*" C FFI function.
        TypeVariant::Enum(enm) =>
            DartOperation::Call {
                var_name: param.name.clone(),
                call: format!("{enm}.fromValue({}.value)", param.name),
                is_ffi_call: true,
            },
        // Skip processing parameter, reference the parameter by name
        // directly, as defined in the function interface (usually the
        // case for primitive types).
        _ => return None,
    };

    Some(op)
}

pub fn param_c_ffi_defer_call(param: &ParamInfo) -> Option<DartOperation> {
    let op = match &param.ty.variant {
        TypeVariant::String => {
            let (var_name, call) = (
                param.name.clone(),
                Some(format!("TWStringDelete({})", param.name)),
            );

            if param.ty.is_nullable {
                DartOperation::DeferOptionalCall { var_name, call }
            } else {
                DartOperation::DeferCall { var_name, call }
            }
        }
        TypeVariant::Data => {
            let (var_name, call) = (
                param.name.clone(),
                Some(format!("TWDataDelete({})", param.name)),
            );

            if param.ty.is_nullable {
                DartOperation::DeferOptionalCall { var_name, call }
            } else {
                DartOperation::DeferCall { var_name, call }
            }
        }
        _ => return None,
    };

    Some(op)
}

pub fn get_import_from_return(ty: &TypeInfo) -> Option<DartImport> {
    match &ty.variant {
        TypeVariant::Struct(name) => {
            let import = import_name(name);
            Some(DartImport(import))
        }
        TypeVariant::Enum(name) => {
            let enum_name = format!("enums/{}", name);
            let import = import_name(enum_name.as_str());
            Some(DartImport(import))
        }
        _ => None,
    }
}

// Convenience function: wrap the return value, returning the operation. Note
// that types are wrapped differently when returning, compared to
// `param_c_ffi_call`; such as using `TWStringNSString` instead of
// `TWDataCreateWithNSData` for Strings.
pub fn wrap_return(ty: &TypeInfo) -> DartOperation {
    match &ty.variant {
        // E.g.`return TWStringNSString(result)`
        TypeVariant::String => DartOperation::Return {
            call: "TWStringNSString(result)".to_string(),
        },
        TypeVariant::Data => DartOperation::Return {
            call: "TWDataNSData(result)".to_string(),
        },
        // E.g. `return SomeEnum(rawValue: result.rawValue)`
        TypeVariant::Enum(_) => DartOperation::Return {
            call: format!(
                "{}(rawValue: result.rawValue)!",
                DartType::from(ty.variant.clone())
            ),
        },
        // E.g. `return SomeStruct(rawValue: result)`
        TypeVariant::Struct(_) => DartOperation::Return {
            call: format!("{}(rawValue: result)", DartType::from(ty.variant.clone())),
        },
        _ => DartOperation::Return {
            call: "result".to_string(),
        },
    }
}

