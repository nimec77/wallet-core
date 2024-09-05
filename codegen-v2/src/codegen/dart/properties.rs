// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.

use crate::codegen::dart::res::*;
use super::*;
use crate::manifest::PropertyInfo;
use crate::codegen::dart::utils::*;

/// This function checks each property and determines whether there's an
/// association with the passed on object (struct or enum), based on common name
/// prefix, and maps the data into a Swift structure.
///
/// This function returns a tuple of associated Swift properties and skipped
/// respectively non-associated properties.
pub(super) fn process_properties(
    object: &ObjectVariant,
    properties: Vec<PropertyInfo>,
    core_var_name: &str,
) -> Result<(Vec<DartProperty>, Vec<PropertyInfo>, Vec<DartImport>, Vec<PackageImport>)> {
    let mut dart_props = vec![];
    let mut skipped_props = vec![];
    let mut dart_imports = vec![];
    let mut package_imports = vec![];

    for prop in properties {
        if !prop.name.starts_with(object.name()) {
            // Property is not assciated with the object.
            skipped_props.push(prop);
            continue;
        }

        let mut ops = vec![];

        // Initialize the 'self' type, which is then passed on to the underlying
        // C FFI function.
        ops.push(match object {
            // E.g. `final obj = pointer;`
            ObjectVariant::Struct(_) => DartOperation::Call {
                var_name: "obj".to_string(),
                call: "pointer".to_string(),
                is_final: true,
                core_var_name: None,
            },
            // E.g. `final obj = TWSomeEnum.fromValue(value");`
            ObjectVariant::Enum(name) => DartOperation::Call {
                var_name: "obj".to_string(),
                call: format!("{}.fromValue(value)", name),
                is_final: true,
                core_var_name: None,
            },
        });

        // Call the underlying C FFI function, passing on the `obj` instance.
        //
        // E.g: `final result = TWSomeFunc(obj);`.
        let (var_name, call) = ("result".to_string(), format!("{}(obj)", prop.name));
        if prop.return_type.is_nullable {
            ops.push(DartOperation::GuardedCall {
                var_name,
                call,
                core_var_name: Some(core_var_name.to_string()),
            });
            dart_imports.push(DartImport(DART_FFI_IMPORT.to_string()));
        } else {
            ops.push(DartOperation::Call {
                var_name: var_name.clone(),
                call,
                is_final: true,
                core_var_name: Some(core_var_name.to_string()),
            });
        }

        let add_import_required =
            if let TypeVariant::Enum(name) | TypeVariant::Struct(name) = &prop.return_type.variant {
                name != object.name()
            } else {
                true
            };
        if add_import_required {
            // Get imports for the return type.
            let (mut dart_vec, mut package_vec) = get_import_from_return(&prop.return_type);
            dart_imports.append(dart_vec.as_mut());
            package_imports.append(package_vec.as_mut());
        }
        // Wrap result.
        let op = wrap_return(&prop.return_type, core_var_name);
        ops.push(op.clone());
        if matches!(op, DartOperation::ReturnWithDispose { .. }) {
            match prop.return_type.variant {
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

        // Prettify name, remove object name prefix from this property.
        let pretty_name = pretty_name_without_prefix(&prop.name, object.name());

        // Convert return type for property interface.
        let return_type = DartReturn {
            var_type: DartType::from(prop.return_type.variant),
            is_nullable: prop.return_type.is_nullable,
        };

        let is_override = pretty_name == "description" && has_address_protocol(object.name());

        dart_props.push(DartProperty {
            name: pretty_name,
            is_public: prop.is_public,
            is_override,
            operations: ops,
            return_type,
            comments: vec![],
        });
    }

    Ok((dart_props, skipped_props, dart_imports, package_imports))
}
