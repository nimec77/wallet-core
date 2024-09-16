// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.

use crate::codegen::dart::res::{CORE_VAR_NAME, MAX_LINE_LENGTH};
use super::*;
use crate::manifest::{FunctionInfo, TypeVariant};
use crate::codegen::dart::utils::*;

/// This function checks each function and determines whether there's an
/// association with the passed on object (struct or enum), based on common name
/// prefix, and maps the data into a Dart structure.
///
/// This function returns a tuple of associated Dart functions and the skipped
/// respectively non-associated functions.
pub(super) fn process_methods(
    object: &ObjectVariant,
    functions: Vec<FunctionInfo>,
) -> Result<(Vec<DartFunction>, Vec<FunctionInfo>)> {
    let mut dart_funcs = vec![];
    let mut skipped_funcs = vec![];

    for func in functions {
        if !func.name.starts_with(object.name()) {
            // Function is not associated with the object.
            skipped_funcs.push(func);
            continue;
        }

        let mut defined_vars = vec![];
        let params_types = func
            .params
            .iter()
            .map(|param| &param.ty.variant)
            .collect::<Vec<&TypeVariant>>();
        let has_finally = func.return_type.is_nullable
            & (params_types.contains(&&TypeVariant::String)
            || params_types.contains(&&TypeVariant::Data));

        let mut ops = vec![];

        // Initialize the 'self' type, which is then passed on to the underlying
        // C FFI function, assuming the function is not static.
        //
        // E.g:
        // - `final obj = pointer;`
        // - `final obj = TWSomeEnum.fromValue(value);`
        if !func.is_static {
            ops.push(match object {
                ObjectVariant::Struct(_) => DartOperation::Call {
                    var_name: "obj".to_string(),
                    call: "pointer".to_string(),
                    is_final: true,
                    core_var_name: None,
                },
                ObjectVariant::Enum(name) => DartOperation::Call {
                    var_name: "obj".to_string(),
                    call: format!("{name}.fromValue(value)"),
                    is_final: true,
                    core_var_name: None,
                },
            });
        }

        // For each parameter, we track a list of `params` which is used for the
        // function interface and add the necessary operations on how to process
        // those parameters.
        let mut params = vec![];
        for param in &func.params {
            let param_name = || param.name.to_string();
            // Skip self parameter
            match &param.ty.variant {
                TypeVariant::Enum(name) | TypeVariant::Struct(name)
                if name == object.name() => {
                    continue
                }
                _ => {}
            }

            let local_name: String;
            let mut call_name = get_call_var_name(param);
            // Process parameter.
            if let (Some(op), call_var_name) = param_c_ffi_call(&param, !has_finally) {
                local_name = get_local_var_name(param);
                if let Some(call_var_name) = call_var_name {
                    call_name = call_var_name;
                }
                ops.push(op)
            } else {
                local_name = param_name();
            }
            // Convert parameter to Dart parameter for the function interface.
            let var = DartVariable {
                name: param_name(),
                local_name,
                call_name,
                var_type: DartType::from(param.ty.variant.clone()),
                is_nullable: param.ty.is_nullable,
            };
            if param.ty.is_nullable && !matches!(param.ty.variant, TypeVariant::Struct(_)) {
                defined_vars.push(DartVariable {
                    var_type: DartType(var.var_type.to_wrapper_type().to_string()),
                    ..var.clone()
                });
            }
            params.push(var);
        }

        // Prepepare parameter list to be passed on to the underlying C FFI function.
        let param_name_vec = if func.is_static { vec![] } else { vec!["obj".to_string()] };
        let mut param_names = param_name_vec
            .into_iter()
            .chain(params.iter().map(|p| p.call_name.to_string()))
            .collect::<Vec<String>>()
            .join(", ");
        const PADDING: usize = 24;
        if param_names.len() + CORE_VAR_NAME.len() + func.name.len() + PADDING >= MAX_LINE_LENGTH {
            param_names.push_str(",");
        }
        // Call the underlying C FFI function, passing on the parameter list.
        let (var_name, call) = (
            "result".to_string(),
            format!("{}({})", func.name, param_names),
        );
        if func.return_type.is_nullable {
            ops.push(DartOperation::GuardedCall {
                var_name,
                call,
                core_var_name: Some(CORE_VAR_NAME.to_string()),
            });
        } else {
            ops.push(DartOperation::Call {
                var_name,
                call,
                is_final: !has_finally,
                core_var_name: Some(CORE_VAR_NAME.to_string()),
            });
        }

        // Add Defer operation to release memory.
        for param in &func.params {
            match &param.ty.variant {
                TypeVariant::Enum(name) | TypeVariant::Struct(name)
                if name == object.name() => {
                    continue
                }
                _ => {}
            }

            if let Some(op) = param_c_ffi_defer_call(&param) {
                ops.push(op);
            }
        }

        // Wrap result.
        ops.push(wrap_return(&func.return_type));

        // Convert return type for function interface.
        let return_type = DartReturn {
            var_type: DartType::from(func.return_type.variant),
            is_nullable: func.return_type.is_nullable,
        };

        // Prettify name, remove object name prefix from this property.
        let pretty_name = pretty_func_name(&func.name, object.name());

        dart_funcs.push(DartFunction {
            name: pretty_name,
            is_public: func.is_public,
            is_static: func.is_static,
            has_finally,
            defined_vars,
            operations: ops,
            params: params.into_iter().collect(),
            return_type,
            comments: vec![],
        });
    }

    Ok((dart_funcs, skipped_funcs))
}
