// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.

use std::collections::HashSet;
use super::{inits::process_deinits, *};
use crate::codegen::dart::utils::*;

#[derive(Debug, Clone)]
pub struct RenderInput<'a> {
    pub file_info: FileInfo,
    pub struct_template: &'a str,
    pub extension_template: &'a str,
    pub partial_init_template: &'a str,
    pub partial_init_finally_template: &'a str,
    pub partial_func_template: &'a str,
    pub partial_func_finally_template: &'a str,
    pub partial_func_ex_template: &'a str,
    pub partial_prop_template: &'a str,
    pub partial_prop_ex_template: &'a str,
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
    pub extensions: Vec<DartEnumExtension>,
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
    let pretty_file_name = pretty_file_name(&input.file_info.name);

    let mut engine = Handlebars::new();
    // Unmatched variables should result in an error.
    engine.set_strict_mode(true);

    engine.register_partial("struct", input.struct_template)?;
    engine.register_partial("extension", input.extension_template)?;
    engine.register_partial("partial_init", input.partial_init_template)?;
    engine.register_partial("partial_init_finally", input.partial_init_finally_template)?;
    engine.register_partial("partial_func", input.partial_func_template)?;
    engine.register_partial("partial_func_finally", input.partial_func_finally_template)?;
    engine.register_partial("partial_func_ex", input.partial_func_ex_template)?;
    engine.register_partial("partial_prop", input.partial_prop_template)?;
    engine.register_partial("partial_prop_ex", input.partial_prop_ex_template)?;

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

    Ok(out_str)
}

/// Uses the given input templates to render all files.
pub fn generate_dart_types(mut info: FileInfo) -> Result<GeneratedDartTypes> {
    let mut outputs = GeneratedDartTypes::default();

    // Render structs/classes.
    for strct in info.structs {
        let obj = ObjectVariant::Struct(&strct.name);

        // Process items.
        let (
            inits,
            deinits,
            mut methods,
            properties,
            mut dart_imports
        );

        let mut imports = HashSet::new();
        (inits, info.inits, dart_imports) = process_inits(&obj, info.inits)?;
        imports.extend(dart_imports);
        (deinits, info.deinits) = process_deinits(&obj, info.deinits)?;
        (methods, info.functions, dart_imports) = process_methods(&obj, info.functions, None)?;
        imports.extend(dart_imports);
        (properties, info.properties, dart_imports) = process_properties(&obj, info.properties, "_core")?;
        imports.extend(dart_imports);

        // Avoid rendering empty structs.
        if inits.is_empty() && methods.is_empty() && properties.is_empty() {
            continue;
        }

        // Convert the name into an appropriate format.
        let pretty_struct_name = pretty_name(&strct.name);

        // Add Disposable and superclasses
        let mut superclasses = vec![];
        if !deinits.is_empty() {
            superclasses.push("Disposable".to_string());
        }
        if has_address_protocol(strct.name.as_str()) {
            superclasses.push("Address".to_string());
        }
        if !superclasses.is_empty() {
            imports.insert(DartImport(import_name("abstractions", Some("common/"))));
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

        outputs.structs.push(DartStruct {
            name: pretty_struct_name.clone(),
            is_class: strct.is_class,
            is_public: strct.is_public,
            raw_type: format!("Pointer<{}>", &strct.name),
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
        let mut imports = HashSet::new();
        // Process items.
        let (methods, properties, mut dart_imports);
        (methods, info.functions, dart_imports) = process_methods(&obj, info.functions, Some("core"))?;
        imports.extend(dart_imports);
        (properties, info.properties, dart_imports) = process_properties(&obj, info.properties, "core")?;
        imports.extend(dart_imports);

        if !methods.is_empty() || !properties.is_empty() {
            imports.insert(DartImport(import_name("generated_bindings", Some("gen/ffi/"))));
        }

        let mut add_description = false;
        let variants = enm
            .variants
            .into_iter()
            .map(|info| {
                if info.as_string.is_some() {
                    add_description = true;
                }
                DartEnumVariant {
                    name: info.name,
                    value: info.value,
                    as_string: info.as_string,
                }
            })
            .collect();

        // Avoid rendering empty extension for enums.
        if !add_description && methods.is_empty() && properties.is_empty() {
            continue;
        }

        outputs.extensions.push(DartEnumExtension {
            name: enm.name,
            init_instance: true,
            add_description,
            imports: imports.into_iter().collect(),
            methods,
            properties,
            variants,
        });
    }

    Ok(outputs)
}
