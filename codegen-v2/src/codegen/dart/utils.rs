use convert_case::{Case, Casing};
use heck::ToLowerCamelCase;
use crate::codegen::dart::{DartImport, DartOperation, DartType};
use crate::codegen::dart::res::*;
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

pub fn import_name(name: &str, path: Option<&str>) -> String {
    let path = TRUST_WALLET_PACKAGE_PATH.to_owned() + path.unwrap_or_else(|| "");
    format!("import '{}{}.dart';", path, pretty_file_name(name))
}

pub fn has_address_protocol(name: &str) -> bool {
    pretty_name(name).ends_with("Address")
}

pub fn get_import_from_param(param: &ParamInfo) -> Option<DartImport> {
    match &param.ty.variant {
        TypeVariant::Struct(name) => {
            let import = import_name(&name, None);
            Some(DartImport(import))
        }
        TypeVariant::String => {
            let import = import_name(STRING_WRAPPER_CLASS, Some("common/"));
            Some(DartImport(import))
        }
        TypeVariant::Data => {
            let import = import_name(DATA_WRAPPER_CLASS, Some("common/"));
            Some(DartImport(import))
        }
        _ => None,
    }
}

pub fn get_local_var_name(param: &ParamInfo) -> String {
    let dart_type = DartType::from(param.ty.variant.clone()).0.to_string();
    let suffix = match &param.ty.variant {
        TypeVariant::Struct(_) | TypeVariant::Enum(_) => None,
        _ => Some(&dart_type),
    };
    if suffix.is_none() {
        param.name.clone()
    } else {
        format!("{}_{}", &param.name, suffix.unwrap()).to_lower_camel_case()
    }
}


// Convenience function: process the parameter, returning the operation for
// handling the C FFI call (if any).
pub fn param_c_ffi_call(param: &ParamInfo, is_final: bool, core_var_name: &str) -> Option<DartOperation> {
    let local_var_name = get_local_var_name(param);
    let op = match &param.ty.variant {
        // E.g. `final param = TStringImpl.createWithUTF8Bytes(core, param);`
        TypeVariant::String => {
            let (var_name, call) = (
                local_var_name,
                format!("{}.createWithString({}, {})", STRING_WRAPPER_CLASS, &core_var_name, param.name),
            );

            // If the parameter is nullable, add special handler.
            if param.ty.is_nullable {
                DartOperation::CallOptional {
                    param_name: param.name.clone(),
                    var_name,
                    var_type: STRING_WRAPPER_CLASS.to_string(),
                    call,
                    is_final,
                    core_var_name: None,
                }
            } else {
                DartOperation::Call {
                    var_name,
                    call,
                    is_final,
                    core_var_name: None,
                }
            }
        }
        TypeVariant::Data => {
            let (var_name, call) = (
                local_var_name,
                format!("{}.createWithBytes({}, {})", DATA_WRAPPER_CLASS, &core_var_name, param.name),
            );

            // If the parameter is nullable, add special handler.
            if param.ty.is_nullable {
                DartOperation::CallOptional {
                    param_name: param.name.clone(),
                    var_name,
                    var_type: "Pointer<Void>".to_string(),
                    call,
                    is_final: true,
                    core_var_name: None,
                }
            } else {
                DartOperation::Call {
                    var_name,
                    call,
                    is_final: true,
                    core_var_name: None,
                }
            }
        }
        // E.g.
        // - `final param = param.pointer;`
        // - `final param = param?.pointer;`
        TypeVariant::Struct(_) => {
            // For nullable structs, we do not use the special
            // `CallOptional` handler but rather use the question mark
            // operator.
            let (var_name, call) = if param.ty.is_nullable {
                (
                    local_var_name,
                    format!("{}?.pointer", param.name),
                )
            } else {
                (
                    local_var_name,
                    format!("{}.pointer", param.name)
                )
            };

            DartOperation::Call {
                var_name,
                call,
                is_final,
                core_var_name: None,
            }
        }
        // Skip processing parameter, reference the parameter by name
        // directly, as defined in the function interface (usually the
        // case for primitive types).
        _ => return None,
    };

    Some(op)
}

pub fn param_c_ffi_defer_call(param: &ParamInfo) -> Option<DartOperation> {
    let local_var_name = get_local_var_name(param);
    let op = match &param.ty.variant {
        TypeVariant::String => {
            let format_str = if param.ty.is_nullable {
                format!("{}?.dispose()", local_var_name)
            } else {
                format!("{}.dispose()", local_var_name)
            };
            let (var_name, call) = (
                local_var_name.clone(),
                Some(format_str),
            );

            if param.ty.is_nullable {
                DartOperation::DeferOptionalCall {
                    var_name,
                    call,
                    core_var_name: None,
                }
            } else {
                DartOperation::DeferCall {
                    var_name,
                    call,
                    core_var_name: None,
                }
            }
        }
        TypeVariant::Data => {
            let format_str = if param.ty.is_nullable {
                format!("{}?.dispose()", local_var_name)
            } else {
                format!("{}.dispose()", local_var_name)
            };
            let (var_name, call) = (
                local_var_name.clone(),
                Some(format_str),
            );

            if param.ty.is_nullable {
                DartOperation::DeferOptionalCall {
                    var_name,
                    call,
                    core_var_name: None,
                }
            } else {
                DartOperation::DeferCall {
                    var_name,
                    call,
                    core_var_name: None,
                }
            }
        }
        _ => return None,
    };

    Some(op)
}

pub fn get_import_from_return(ty: &TypeInfo) -> Option<DartImport> {
    match &ty.variant {
        TypeVariant::Struct(name) => {
            let import = import_name(&name, None);
            Some(DartImport(import))
        }
        _ => None,
    }
}

// Convenience function: wrap the return value, returning the operation.
pub fn wrap_return(ty: &TypeInfo, core_var_name: &str) -> DartOperation {
    match &ty.variant {
        // E.g.`return TWStringNSString(result)`
        TypeVariant::String => DartOperation::ReturnWithDispose {
            call: format!(
                "{}.createWithPointer({}, result)",
                STRING_WRAPPER_CLASS,
                core_var_name
            ),
            get_method: "dartString".to_string(),
        },
        TypeVariant::Data => DartOperation::ReturnWithDispose {
            call: format!(
                "{}.createWithData({}, result)",
                DATA_WRAPPER_CLASS,
                core_var_name
            ),
            get_method: "bytes".to_string(),
        },
        // E.g. `return SomeEnum.fromValue(result.value)`
        TypeVariant::Enum(_) => DartOperation::Return {
            call: format!(
                "{}.fromValue(result.value)",
                DartType::from(ty.variant.clone())
            ),
        },
        // E.g. `return SomeStruct(core, result);`
        TypeVariant::Struct(_) => DartOperation::Return {
            call: format!(
                "{}({}, result)",
                DartType::from(ty.variant.clone()),
                core_var_name
            ),
        },
        _ => DartOperation::Return {
            call: "result".to_string(),
        },
    }
}

