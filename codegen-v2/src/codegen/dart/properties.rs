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
) -> Result<(Vec<DartProperty>, Vec<PropertyInfo>)> {
    let mut dart_props = vec![];
    let mut skipped_props = vec![];

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
                core_var_name: Some("_bindings".to_string()),
            });
        } else {
            ops.push(DartOperation::Call {
                var_name: var_name.clone(),
                call,
                is_final: true,
                core_var_name: Some("_bindings".to_string()),
            });
        }

        // Wrap result.
        let op = wrap_return(&prop.return_type);
        ops.push(op.clone());

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

    Ok((dart_props, skipped_props))
}
