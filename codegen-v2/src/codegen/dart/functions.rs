// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.

use crate::codegen::dart::res::*;
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
    core_var_name: Option<&str>,
) -> Result<(Vec<DartFunction>, Vec<FunctionInfo>, Vec<DartImport>, Vec<PackageImport>)> {
    let mut dart_funcs = vec![];
    let mut skipped_funcs = vec![];
    let mut dart_imports = vec![];
    let mut package_imports = vec![];

    for func in functions {
        let mut defined_vars = vec![];
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
            let import = import_name(TRUST_WALLET_CORE_PATH, None);
            package_imports.push(PackageImport(import));
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
            let mut call_name = get_call_var_name(&param);
            // Process parameter.
            if let (Some(op), call_var_name) = param_c_ffi_call(&param, !has_finally, core_var) {
                local_param_name = get_local_var_name(param);
                if let Some(call_var_name) = call_var_name {
                    call_name = call_var_name;
                }
                ops.push(op)
            }
            // Convert parameter to Dart parameter for the function interface.
            let var = DartVariable {
                name: param.name.clone(),
                local_name: local_param_name.clone(),
                call_name,
                var_type: DartType::from(param.ty.variant.clone()),
                is_nullable: param.ty.is_nullable,
            };
            if param.ty.is_nullable {
                let defined_var = DartVariable {
                    var_type: DartType(var.var_type.to_wrapper_type().to_string()),
                    ..var.clone()
                };
                defined_vars.push(defined_var);
            }
            params.push(var);
        }

        // Prepepare parameter list to be passed on to the underlying C FFI function.
        let param_name = if func.is_static { vec![] } else { vec!["obj".to_string()] };
        let param_names = param_name
            .into_iter()
            .chain(params.iter().map(|p| p.call_name.clone()))
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
            dart_imports.push(DartImport(DART_FFI_IMPORT.to_string()));
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
            let (mut dart_vec, mut package_vec) = get_import_from_param(param);
            dart_imports.append(dart_vec.as_mut());
            package_imports.append(package_vec.as_mut());

            if let Some(op) = param_c_ffi_defer_call(&param) {
                ops.push(op);
            }
        }

        if let TypeVariant::Enum(name) | TypeVariant::Struct(name) = &func.return_type.variant {
            if name != object.name() {
                // Get imports for the return type.
                let (mut dart_vec, mut package_vec) = get_import_from_return(&func.return_type);
                dart_imports.append(dart_vec.as_mut());
                package_imports.append(package_vec.as_mut());
            }
        }
        // Wrap result.
        let op = wrap_return(&func.return_type, core_var);
        ops.push(op.clone());
        if matches!(op, DartOperation::ReturnWithDispose { .. }) {
            match func.return_type.variant {
                TypeVariant::String => {
                    let import = import_name(STRING_WRAPPER_CLASS, Some("common/"));
                    package_imports.push(PackageImport(import));
                }
                TypeVariant::Data => {
                    let import = import_name(DATA_WRAPPER_CLASS, Some("common/"));
                    package_imports.push(PackageImport(import));
                }
                _ => {}
            }
        }

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

    Ok((dart_funcs, skipped_funcs, dart_imports, package_imports))
}
