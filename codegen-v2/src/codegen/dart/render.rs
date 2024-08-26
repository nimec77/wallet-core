// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.

use std::collections::HashSet;
use super::{inits::process_deinits, *};
use crate::codegen::dart::utils::{has_address_protocol, import_name, pretty_file_name, pretty_name};

#[derive(Debug, Clone)]
pub struct RenderInput<'a> {
    pub file_info: FileInfo,
    pub struct_template: &'a str,
    pub enum_template: &'a str,
    pub extension_template: &'a str,
    pub proto_template: &'a str,
    pub partial_init_template: &'a str,
    pub partial_init_defer_template: &'a str,
    pub partial_func_template: &'a str,
    pub partial_func_defer_template: &'a str,
    pub partial_prop_template: &'a str,
}

#[derive(Debug, Clone, Default)]
pub struct GeneratedDartTypesStrings {
    pub structs: Vec<(String, String)>,
    pub enums: Vec<(String, String)>,
    pub extensions: Vec<(String, String)>,
    pub protos: Vec<(String, String)>,
}

#[derive(Debug, Clone, Default)]
pub struct GeneratedDartTypes {
    pub structs: Vec<DartStruct>,
    pub enums: Vec<DartEnum>,
    pub extensions: Vec<DartEnumExtension>,
    pub protos: Vec<DartProto>,
}

/// Convenience wrapper for setting copyright year when generating bindings.
#[derive(Debug, Clone, Serialize)]
struct WithYear<'a, T> {
    pub current_year: u64,
    #[serde(flatten)]
    pub data: &'a T,
}

pub fn render_to_strings(input: RenderInput) -> Result<GeneratedDartTypesStrings> {
    // The current year for the copyright header in the generated bindings.
    let current_year = crate::current_year();
    // Convert the name into an appropriate format.
    let pretty_file_name = pretty_file_name(input.file_info.name.clone());

    let mut engine = Handlebars::new();
    // Unmatched variables should result in an error.
    engine.set_strict_mode(true);

    engine.register_partial("struct", input.struct_template)?;
    engine.register_partial("enum", input.enum_template)?;
    engine.register_partial("extension", input.extension_template)?;
    engine.register_partial("proto", input.proto_template)?;
    engine.register_partial("partial_init", input.partial_init_template)?;
    engine.register_partial("partial_init_defer", input.partial_init_defer_template)?;
    engine.register_partial("partial_func", input.partial_func_template)?;
    engine.register_partial("partial_func_defer", input.partial_func_defer_template)?;
    engine.register_partial("partial_prop", input.partial_prop_template)?;

    let rendered = generate_dart_types(input.file_info)?;
    let mut out_str = GeneratedDartTypesStrings::default();

    //  Render structs.
    for strct in rendered.structs {
        let out = engine.render(
            "struct",
            &WithYear {
                current_year,
                data: &strct,
            },
        )?;

        out_str.structs.push((pretty_file_name.clone(), out));
    }

    //  Render enums.
    for enm in rendered.enums {
        let out = engine.render(
            "enum",
            &WithYear {
                current_year,
                data: &enm,
            },
        )?;

        out_str.enums.push((pretty_file_name.clone(), out));
    }

    //  Render extensions.
    for ext in rendered.extensions {
        let out = engine.render(
            "extension",
            &WithYear {
                current_year,
                data: &ext,
            },
        )?;

        out_str.extensions.push((pretty_file_name.clone(), out));
    }

    //  Render protos.
    if !rendered.protos.is_empty() {
        let out = engine.render(
            "proto",
            &WithYear {
                current_year,
                data: &json!({
                    "protos": &rendered.protos
                }),
            },
        )?;

        out_str.protos.push((pretty_file_name, out));
    }

    Ok(out_str)
}

/// Uses the given input templates to render all files.
pub fn generate_dart_types(mut info: FileInfo) -> Result<GeneratedDartTypes> {
    let mut outputs = GeneratedDartTypes::default();

    // Render structs/classes.
    for strct in info.structs {
        let obj = ObjectVariant::Struct(&strct.name);
        let mut imports = HashSet::new();

        // Process items.
        let (inits, deinits, mut methods, properties);
        (inits, info.inits) = process_inits(&obj, info.inits)?;
        (deinits, info.deinits) = process_deinits(&obj, info.deinits)?;
        (methods, info.functions) = process_methods(&obj, info.functions)?;
        (properties, info.properties) = process_properties(&obj, info.properties)?;

        // Avoid rendering empty structs.
        if inits.is_empty() && methods.is_empty() && properties.is_empty() {
            continue;
        }

        // Convert the name into an appropriate format.
        let pretty_struct_name = pretty_name(strct.name.clone());

        // Add Disposable and superclasses
        let mut superclasses = vec![];
        if !deinits.is_empty() {
            superclasses.push("Disposable".to_string());
        }
        if has_address_protocol(strct.name.as_str()) {
            superclasses.push("Address".to_string());
        }

        // Handle equality operator.
        let eq_method = methods.iter().enumerate().find(|(_, f)| f.name == "equal");
        let eq_operator = if let Some((idx, _)) = eq_method {
            let operator = DartOperatorEquality {
                c_ffi_name: format!("{}Equal", strct.name),
            };

            // Remove that method from the `methods` list.
            methods.remove(idx);

            Some(operator)
        } else {
            None
        };

        for super_class in &superclasses {
            imports.insert(import_name(super_class.as_str()));
        }

        outputs.structs.push(DartStruct {
            name: pretty_struct_name,
            is_class: strct.is_class,
            is_public: strct.is_public,
            raw_type: "Pointer<Opaque>".to_string(),
            init_instance: strct.is_class,
            imports: imports.into_iter().collect(),
            superclasses,
            eq_operator,
            inits,
            deinits,
            methods,
            properties,
        });
    }

    // Render enums.
    for enm in info.enums {
        let obj = ObjectVariant::Enum(&enm.name);
        // Process items.
        let (methods, properties);
        (methods, info.functions) = process_methods(&obj, info.functions)?;
        (properties, info.properties) = process_properties(&obj, info.properties)?;

        // Convert the name into an appropriate format.
        let pretty_enum_name = pretty_name(enm.name);

        let add_class = false;

        // Convert to Dart enum variants
        let variants: Vec<DartEnumVariant> = enm
            .variants
            .into_iter()
            .map(|info| DartEnumVariant {
                name: if info.name == "default" {
                    "defaultValue".to_string()
                } else {
                    info.name
                },
                value: info.value,
                as_string: info.as_string,
            })
            .collect();

        // Add the generated Dart code to the outputs
        outputs.enums.push(DartEnum {
            name: pretty_enum_name.clone(),
            is_public: enm.is_public,
            add_description: add_class,
            variants,
            value_type: "int".to_string(),
        });

        // Avoid rendering empty extension for enums.
        if methods.is_empty() && properties.is_empty() {
            continue;
        }

        outputs.extensions.push(DartEnumExtension {
            name: pretty_enum_name,
            init_instance: true,
            methods,
            properties,
        });
    }


    // Render Protobufs.
    if !info.protos.is_empty() {
        for proto in info.protos {
            outputs.protos.push(DartProto::try_from(proto)?);
        }
    }

    Ok(outputs)
}
