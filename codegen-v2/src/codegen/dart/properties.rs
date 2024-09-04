// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.

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
                core_var_name: Some(core_var_name.to_string()),
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
        } else {
            ops.push(DartOperation::Call {
                var_name,
                call,
                is_final: true,
                core_var_name: Some(core_var_name.to_string()),
            });
        }

        let mut add_import_required = true;
        if let TypeVariant::Enum(name) | TypeVariant::Struct(name) = &prop.return_type.variant {
            add_import_required = name != object.name();
        }
        if add_import_required {
            // Get imports for the return type.
            let (mut dart_vec, mut package_vec) = get_import_from_return(&prop.return_type);
            dart_imports.append(dart_vec.as_mut());
            package_imports.append(package_vec.as_mut());
        }
        // Wrap result.
        ops.push(wrap_return(&prop.return_type, core_var_name));

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
