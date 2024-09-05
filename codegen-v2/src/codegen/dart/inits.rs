// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.

use crate::codegen::dart::res::{DART_FFI_IMPORT, TRUST_WALLET_CORE_PATH};
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
) -> Result<(Vec<DartInit>, Vec<InitInfo>, Vec<DartImport>, Vec<PackageImport>)> {
    let mut dart_inits = vec![];
    let mut skipped_inits = vec![];
    let mut dart_imports = vec![];
    let mut package_imports = vec![];

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
            & (type_variants.contains(&&TypeVariant::String)
            || type_variants.contains(&&TypeVariant::Data));
        // For each parameter, we track a list of `params` which is used for the
        // function interface and add the necessary operations on how to process
        // those parameters.
        let mut params = vec![];
        for param in &init.params {
            let mut local_param_name = param.name.clone();
            let mut call_name = get_call_var_name(&param);
            // Process parameter.
            if let (Some(op), call_var_name) = param_c_ffi_call(&param, !has_finally, "core") {
                local_param_name = get_local_var_name(param);
                if let Some(call_var_name) = call_var_name {
                    call_name = call_var_name;
                }
                ops.push(op);
            }
            // Convert parameter to Dart parameter.
            params.push((DartVariable {
                name: param.name.clone(),
                local_name: local_param_name.clone(),
                call_name: call_name.clone(),
                var_type: DartType::from(param.ty.variant.clone()),
                is_nullable: param.ty.is_nullable,
            }, matches!(param.ty.variant, TypeVariant::String | TypeVariant::Data)));

            if has_finally {
                if let TypeVariant::String | TypeVariant::Data = &param.ty.variant {
                    finally_vars.push(DartVariable {
                        name: param.name.clone(),
                        local_name: local_param_name.clone(),
                        call_name,
                        var_type: DartType::from(param.ty.variant.clone()).to_wrapper_type(),
                        is_nullable: param.ty.is_nullable,
                    });
                }
            }

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
        }

        // Prepare parameter list to be passed on to the underlying C FFI function.
        let param_names = params
            .iter()
            .map(|(p, is_wrapped)| {
                let param_name = p.local_name.as_str();
                if *is_wrapped {
                    format!("{}.pointer", param_name)
                } else {
                    param_name.to_string()
                }
            })
            .collect::<Vec<String>>()
            .join(", ");

        // Call the underlying C FFI function, passing on the parameter list.
        if init.is_nullable {
            ops.push(DartOperation::GuardedCall {
                var_name: "result".to_string(),
                call: format!("{}({})", init.name, param_names),
                core_var_name: Some("core".to_string()),
            });
            dart_imports.push(DartImport(DART_FFI_IMPORT.to_string()));
        } else {
            ops.push(DartOperation::Call {
                var_name: "result".to_string(),
                call: format!("{}({})", init.name, param_names),
                is_final: true,
                core_var_name: Some("core".to_string()),
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
            params: params.into_iter().map(|(p, _)| p).collect(),
            operations: ops,
            finally_vars,
            comments: vec![],
        });
    }
    if !dart_inits.is_empty() {
        let import = import_name(TRUST_WALLET_CORE_PATH, None);

        package_imports.push(PackageImport(import));
    }

    Ok((dart_inits, skipped_inits, dart_imports, package_imports))
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
