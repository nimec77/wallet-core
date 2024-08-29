// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.

use super::*;
use crate::codegen::dart::utils::*;
use crate::manifest::InitInfo;

/// This function checks each constructor and determines whether there's an
/// association with the passed on object (struct or enum), based on common name
/// prefix, and maps the data into a Dart structure.
///
/// This function returns a tuple of associated Dart constructor and the skipped
/// respectively non-associated constructors.
pub(super) fn process_inits(
    object: &ObjectVariant,
    inits: Vec<InitInfo>,
) -> Result<(Vec<DartInit>, Vec<InitInfo>, Vec<DartImport>)> {
    let mut dart_inits = vec![];
    let mut skipped_inits = vec![];
    let mut imports = vec![];

    for init in inits {
        let mut finally_vars = vec![];
        if !init.name.starts_with(object.name()) {
            // Init is not assciated with the object.
            skipped_inits.push(init);
            continue;
        }

        let mut ops = vec![];

        let type_variants = init
            .params
            .iter()
            .map(|param| &param.ty.variant)
            .collect::<Vec<&TypeVariant>>();
        let has_finally = init.is_nullable
            & type_variants.contains(&&TypeVariant::String)
            || type_variants.contains(&&TypeVariant::Data);
        // For each parameter, we track a list of `params` which is used for the
        // function interface and add the necessary operations on how to process
        // those parameters.
        let mut params = vec![];
        for param in &init.params {
            // Convert parameter to Dart parameter.
            params.push(DartVariable {
                name: param.name.clone(),
                var_type: DartType::from(param.ty.variant.clone()),
                is_nullable: param.ty.is_nullable,
            });

            // Process parameter.
            if let Some(op) = param_c_ffi_call(&param, true, !has_finally) {
                ops.push(op);
            }

            if has_finally {
                if let TypeVariant::String | TypeVariant::Data = &param.ty.variant {
                    finally_vars.push(DartVariable {
                        name: param.name.clone(),
                        var_type: DartType::from(param.ty.variant.clone()).to_wrapper_type(),
                        is_nullable: param.ty.is_nullable,
                    });
                }
            }

            if let TypeVariant::Enum(name) | TypeVariant::Struct(name) = &param.ty.variant {
                if name != object.name() {
                    // Get imports for the parameter.
                    if let Some(dart_import) = get_import_from_param(param) {
                        imports.push(dart_import);
                    }
                }
            }
        }

        // Prepare parameter list to be passed on to the underlying C FFI function.
        let param_names = params
            .iter()
            .map(|p| p.name.as_str())
            .collect::<Vec<&str>>()
            .join(", ");

        // Call the underlying C FFI function, passing on the parameter list.
        if init.is_nullable {
            ops.push(DartOperation::GuardedCall {
                var_name: "result".to_string(),
                call: format!("{}({})", init.name, param_names),
            });
        } else {
            ops.push(DartOperation::Call {
                var_name: "result".to_string(),
                call: format!("{}({})", init.name, param_names),
                is_ffi_call: true,
                is_final: true,
            });
        }

        // Add Defer operation to release memory.
        for param in &init.params {
            if let Some(op) = param_c_ffi_defer_call(&param) {
                ops.push(op);
            }
        }

        // Note that we do not return a value here; the template sets a
        // `return SomeClass(core, result);`

        // Prettify name, remove object name prefix from this property.
        let pretty_init_name = pretty_func_name(&init.name, object.name());

        dart_inits.push(DartInit {
            name: pretty_init_name,
            class_name: pretty_name(object.name()),
            is_nullable: init.is_nullable,
            is_public: init.is_public,
            has_finally,
            params,
            operations: ops,
            finally_vars,
            comments: vec![],
        });
    }

    Ok((dart_inits, skipped_inits, imports))
}

pub(super) fn process_deinits(
    object: &ObjectVariant,
    deinit: Vec<DeinitInfo>,
) -> Result<(Vec<DeinitInfo>, Vec<DeinitInfo>)> {
    let mut dart_deinits = vec![];
    let mut skipped_deinits = vec![];

    for deinit in deinit {
        if deinit.name.starts_with(object.name()) {
            dart_deinits.push(deinit)
        } else {
            // Deinit is not associated with the object.
            skipped_deinits.push(deinit);
            continue;
        }
    }

    Ok((dart_deinits, skipped_deinits))
}
