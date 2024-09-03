// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.

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
    core_var_name: Option<&str>
) -> Result<(Vec<DartFunction>, Vec<FunctionInfo>, Vec<DartImport>)> {
    let mut dart_funcs = vec![];
    let mut skipped_funcs = vec![];
    let mut imports = vec![];

    for func in functions {
        let mut finally_vars = vec![];
        if !func.name.starts_with(object.name()) {
            // Function is not associated with the object.
            skipped_funcs.push(func);
            continue;
        }

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
        let core_var: &str;
        if !func.is_static {
            core_var = core_var_name.unwrap_or("_core");
            ops.push(match object {
                ObjectVariant::Struct(_) => DartOperation::Call {
                    var_name: "obj".to_string(),
                    call: "pointer".to_string(),
                    is_final: true,
                    core_var_name: None,
                },
                ObjectVariant::Enum(name) => DartOperation::Call {
                    var_name: "obj".to_string(),
                    call: format!("{}.fromValue(value)", name),
                    is_final: true,
                    core_var_name: Some(core_var.to_string()),
                },
            });
        } else {
            core_var = core_var_name.unwrap_or("core");
        }

        // For each parameter, we track a list of `params` which is used for the
        // function interface and add the necessary operations on how to process
        // those parameters.
        let mut params = vec![];
        for param in &func.params {
            // Skip self parameter
            match &param.ty.variant {
                TypeVariant::Enum(name) | TypeVariant::Struct(name)
                if name == object.name() => {
                    continue
                }
                _ => {}
            }

            let mut local_param_name = param.name.clone();
            // Process parameter.
            if let Some(op) = param_c_ffi_call(&param, !has_finally, core_var) {
                local_param_name = get_local_var_name(param);
                ops.push(op)
            }
            // Convert parameter to Dart parameter for the function interface.
            params.push((DartVariable {
                name: param.name.clone(),
                local_name: local_param_name.clone(),
                var_type: DartType::from(param.ty.variant.clone()),
                is_nullable: param.ty.is_nullable,
            }, matches!(param.ty.variant, TypeVariant::String | TypeVariant::Data)));

            if has_finally {
                if let TypeVariant::String | TypeVariant::Data = &param.ty.variant {
                    finally_vars.push(DartVariable {
                        name: param.name.clone(),
                        local_name: local_param_name.clone(),
                        var_type: DartType::from(param.ty.variant.clone()).to_wrapper_type(),
                        is_nullable: param.ty.is_nullable,
                    });
                }
            }
        }

        // Prepepare parameter list to be passed on to the underlying C FFI function.
        let param_name = if func.is_static { vec![] } else { vec!["obj".to_string()] };
        let param_names = param_name
            .into_iter()
            .chain(params.iter().map(|(p, is_wrapped) | {
                let param_name = p.local_name.as_str();
                if *is_wrapped {
                    format!("{}.pointer", param_name)
                } else {
                    param_name.to_string()
                }
            }))
            .collect::<Vec<String>>()
            .join(", ");

        // Call the underlying C FFI function, passing on the parameter list.
        let (var_name, call) = (
            "result".to_string(),
            format!("{}({})", func.name, param_names),
        );
        if func.return_type.is_nullable {
            ops.push(DartOperation::GuardedCall {
                var_name,
                call,
                core_var_name: Some(core_var.to_string()),
            });
        } else {
            ops.push(DartOperation::Call {
                var_name,
                call,
                is_final: !has_finally,
                core_var_name: Some(core_var.to_string()),
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

            // Get imports for the parameter.
            if let Some(dart_import) = get_import_from_param(param) {
                imports.push(dart_import);
            }

            if let Some(op) = param_c_ffi_defer_call(&param) {
                ops.push(op);
            }
        }

        if let TypeVariant::Enum(name) | TypeVariant::Struct(name) = &func.return_type.variant {
            if name != object.name() {
                // Get imports for the return type.
                if let Some(dart_import) = get_import_from_return(&func.return_type) {
                    imports.push(dart_import);
                }
            }
        }
        // Wrap result.
        ops.push(wrap_return(&func.return_type, core_var));

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
            operations: ops,
            finally_vars,
            params: params.into_iter().map(|(p, _)| p).collect(),
            return_type,
            comments: vec![],
        });
    }

    Ok((dart_funcs, skipped_funcs, imports))
}
