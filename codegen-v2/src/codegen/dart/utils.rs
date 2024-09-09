use crate::codegen::dart::res::*;
use crate::codegen::dart::{DartOperation, DartPart, DartType};
use crate::manifest::{ParamInfo, TypeInfo, TypeVariant};
use convert_case::{Case, Casing};
use heck::ToLowerCamelCase;

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

pub fn has_address_protocol(name: &str) -> bool {
    pretty_name(name).ends_with("Address")
}

pub fn get_local_var_name(param: &ParamInfo) -> String {
    let dart_type = DartType::from(param.ty.variant.clone()).0.to_string();
    let suffix = match &param.ty.variant {
        TypeVariant::Struct(name) => pretty_name(name),
        TypeVariant::Enum(_) => "enum".to_string(),
        _ => dart_type,
    };
    format!("{}_{suffix}", &param.name).to_lower_camel_case()
}

pub fn get_call_var_name(param: &ParamInfo) -> String {
    let local_var_name = get_local_var_name(param);
    if param.ty.is_nullable {
        return format!("{local_var_name}Ptr");
    }
    match param.ty.variant {
        TypeVariant::String | TypeVariant::Data => {
            format!("{local_var_name}.pointer")
        }
        _ => param.name.clone(),
    }
}

// Convenience function: process the parameter, returning the operation for
// handling the C FFI call (if any).
pub fn param_c_ffi_call(param: &ParamInfo, is_final: bool) ->
(Option<DartOperation>, Option<String>) {
    let local_var_name = get_local_var_name(param);
    let call_var_name = get_call_var_name(param);
    let (op, call_name) = match &param.ty.variant {
        // E.g. `final param = TStringImpl.createWithUTF8Bytes(core, param);`
        TypeVariant::String => {
            let (var_name, call) = (
                local_var_name,
                format!("{STRING_WRAPPER_CLASS}.createWithString({})", param.name),
            );

            // If the parameter is nullable, add special handler.
            if param.ty.is_nullable {
                (DartOperation::CallOptional {
                    param_name: param.name.clone(),
                    var_name,
                    call_var_name: call_var_name.clone(),
                    var_type: STRING_WRAPPER_CLASS.to_string(),
                    call,
                    is_final,
                    core_var_name: None,
                },
                 Some(call_var_name))
            } else {
                (DartOperation::Call {
                    var_name,
                    call,
                    is_final,
                    core_var_name: None,
                },
                 None)
            }
        }
        TypeVariant::Data => {
            let (var_name, call) = (
                local_var_name,
                format!("{DATA_WRAPPER_CLASS}.createWithBytes({})", param.name),
            );

            // If the parameter is nullable, add special handler.
            if param.ty.is_nullable {
                (DartOperation::CallOptional {
                    param_name: param.name.clone(),
                    var_name,
                    call_var_name: call_var_name.clone(),
                    var_type: DATA_WRAPPER_CLASS.to_string(),
                    call,
                    is_final: true,
                    core_var_name: None,
                },
                 Some(call_var_name))
            } else {
                (DartOperation::Call {
                    var_name,
                    call,
                    is_final: true,
                    core_var_name: None,
                },
                 None)
            }
        }
        // E.g.
        // - `final paramStruct = param.pointer;`
        // - `final paramStruct = param?.pointer ?? nullptr;`
        TypeVariant::Struct(_) => {
            // For nullable structs, we do not use the special
            // `CallOptional` handler but rather use the question mark
            // operator.
            let (var_name, call) = if param.ty.is_nullable {
                (
                    local_var_name.clone(),
                    format!("{}?.pointer ?? nullptr", param.name),
                )
            } else {
                (
                    local_var_name.clone(),
                    format!("{}.pointer", param.name)
                )
            };

            (DartOperation::Call {
                var_name,
                call,
                is_final,
                core_var_name: None,
            }, Some(local_var_name))
        }
        // E.g. `final param = TWSomeEnum.fromValue(param.value);`
        // Note that it calls the constructor of the enum, which calls
        // the underlying "*Create*" C FFI function.
        TypeVariant::Enum(name) =>
            (DartOperation::Call {
                var_name: local_var_name.clone(),
                call: format!("{name}.fromValue({}.value)", param.name),
                is_final: true,
                core_var_name: None,
            }, Some(local_var_name)),
        // Skip processing parameter, reference the parameter by name
        // directly, as defined in the function interface (usually the
        // case for primitive types).
        _ => return (None, None),
    };

    (Some(op), call_name)
}

pub fn param_c_ffi_defer_call(param: &ParamInfo) -> Option<DartOperation> {
    let local_var_name = get_local_var_name(param);
    let op = match &param.ty.variant {
        TypeVariant::String => {
            let format_str = if param.ty.is_nullable {
                format!("{local_var_name}?.dispose()")
            } else {
                format!("{local_var_name}.dispose()")
            };

            DartOperation::DeferCall {
                var_name: local_var_name,
                call: format_str,
                core_var_name: None,
            }
        }
        TypeVariant::Data => {
            let format_str = if param.ty.is_nullable {
                format!("{local_var_name}?.dispose()")
            } else {
                format!("{local_var_name}.dispose()")
            };

            DartOperation::DeferCall {
                var_name: local_var_name,
                call: format_str,
                core_var_name: None,
            }
        }
        _ => return None,
    };

    Some(op)
}

// Convenience function: wrap the return value, returning the operation.
pub fn wrap_return(ty: &TypeInfo) -> DartOperation {
    match &ty.variant {
        // E.g.`return TWStringNSString(result)`
        TypeVariant::String => DartOperation::ReturnWithDispose {
            call: format!("{STRING_WRAPPER_CLASS}.createWithPointer(result)"),
            get_method: "dartString".to_string(),
        },
        TypeVariant::Data => DartOperation::ReturnWithDispose {
            call: format!("{DATA_WRAPPER_CLASS}.createWithData(result)"),
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
                "{}(result)",
                DartType::from(ty.variant.clone()),
            ),
        },
        _ => DartOperation::Return {
            call: "result".to_string(),
        },
    }
}

pub fn get_parts_from_file_info(struct_name: &str) -> DartPart {
    let part_path = format!("{TRUST_WALLET_PACKAGE_PATH}/src/generated/{}.dart", struct_name.to_case(Case::Snake));

    DartPart(part_path)
}

pub fn replace_forbidden_words(name: &str) -> String {
    match REPLACED_MAP.get(name) {
        Some(replacement) => replacement.to_string(),
        None => name.to_string(),
    }
}