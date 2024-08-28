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
) -> Result<(Vec<DartFunction>, Vec<FunctionInfo>, Vec<DartImport>)> {
    let mut dart_funcs = vec![];
    let mut skipped_funcs = vec![];
    let mut imports = vec![];

    for func in functions {
        let mut has_defer = false;
        if !func.name.starts_with(object.name()) {
            // Function is not associated with the object.
            skipped_funcs.push(func);
            continue;
        }

        let mut ops = vec![];

        // Initialize the 'self' type, which is then passed on to the underlying
        // C FFI function, assuming the function is not static.
        //
        // E.g:
        // - `final obj = rawValue;`
        // - `final obj = TWSomeEnum.fromValue(rawValue);`
        if !func.is_static {
            ops.push(match object {
                ObjectVariant::Struct(_) => DartOperation::Call {
                    var_name: "obj".to_string(),
                    call: "rawValue".to_string(),
                    is_ffi_call: false,
                },
                ObjectVariant::Enum(name) => DartOperation::Call {
                    var_name: "obj".to_string(),
                    call: format!("{}.fromValue(value)", name),
                    is_ffi_call: true,
                },
            });
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

            // Convert parameter to Dart parameter for the function interface.
            params.push(DartParam {
                name: param.name.clone(),
                param_type: DartType::from(param.ty.variant.clone()),
                is_nullable: param.ty.is_nullable,
            });

            // Process parameter.
            if let Some(op) = param_c_ffi_call(&param, func.is_static) {
                ops.push(op)
            }
        }

        // Prepepare parameter list to be passed on to the underlying C FFI function.
        let param_name = if func.is_static { vec![] } else { vec!["obj"] };
        let param_names = param_name
            .into_iter()
            .chain(params.iter().map(|p| p.name.as_str()))
            .collect::<Vec<&str>>()
            .join(", ");

        // Call the underlying C FFI function, passing on the parameter list.
        let (var_name, call) = (
            "result".to_string(),
            format!("{}({})", func.name, param_names),
        );
        if func.return_type.is_nullable {
            ops.push(DartOperation::GuardedCall { var_name, call });
        } else {
            ops.push(DartOperation::Call {
                var_name,
                call,
                is_ffi_call: true,
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
                has_defer = true;
                ops.push(op)
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
        ops.push(wrap_return(&func.return_type, func.is_static));

        // Convert return type for function interface.
        let return_type = DartReturn {
            param_type: DartType::from(func.return_type.variant).to_return_type(),
            is_nullable: func.return_type.is_nullable,
        };

        // Prettify name, remove object name prefix from this property.
        let pretty_name = pretty_func_name(&func.name, object.name());

        dart_funcs.push(DartFunction {
            name: pretty_name,
            is_public: func.is_public,
            is_static: func.is_static,
            has_defer,
            operations: ops,
            params,
            return_type,
            comments: vec![],
        });
    }

    Ok((dart_funcs, skipped_funcs, imports))
}
