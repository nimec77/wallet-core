// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.

use self::functions::process_methods;
use self::inits::process_inits;
use self::properties::process_properties;
use crate::manifest::{DeinitInfo, FileInfo, TypeVariant};
use crate::{Result};
use handlebars::Handlebars;
use std::fmt::Display;
use crate::codegen::dart::utils::pretty_name;

mod functions;
mod inits;
mod properties;
mod render;
mod utils;
mod res;

// Re-exports
pub use self::render::{
    generate_dart_types, render_to_strings, render_trust_core_to_string, GeneratedDartTypes,
    GeneratedDartTypesStrings, RenderTrustCoreInput, RenderInput,
};

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
pub struct DartTrustWallet {
    pub parts: Vec<DartPart>,
}

#[derive(Debug, Clone, Eq, PartialEq, Hash, Serialize, Deserialize, Ord, PartialOrd)]
pub struct DartPart(String);

/// Represents a Dart struct or class.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartStruct {
    name: String,
    is_class: bool,
    is_public: bool,
    init_instance: bool,
    raw_type: String,
    superclasses: Vec<String>,
    eq_operator: Option<DartOperatorEquality>,
    inits: Vec<DartInit>,
    deinits: Vec<DeinitInfo>,
    methods: Vec<DartFunction>,
    properties: Vec<DartProperty>,
}

/// Represents a Dart enum variant.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartEnumVariant {
    name: String,
    value: String,
    as_string: Option<String>,
}

/// Represents associated methods and properties of an enum. Based on the first
/// codegen, those extensions are placed in a separate file.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartEnumExtension {
    name: String,
    init_instance: bool,
    add_description: bool,
    methods: Vec<DartFunction>,
    properties: Vec<DartProperty>,
    variants: Vec<DartEnumVariant>,
}
/// Represents a Dart import statement.
#[derive(Debug, Clone, Eq, PartialEq, Hash, Serialize, Deserialize, Ord, PartialOrd)]
pub struct DartImport(String);

/// Represents a Dart import statement.
#[derive(Debug, Clone, Eq, PartialEq, Hash, Serialize, Deserialize, Ord, PartialOrd)]
pub struct PackageImport(String);

// Wrapper around a valid Dart type (built in or custom). Meant to be used as
// `<DartType as From<TypeVariant>>::from(...)`.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartType(String);

// Replace DartType to return type
impl DartType {
    fn to_wrapper_type(&self) -> DartType {
        let res = match self.0.as_str() {
            "Uint8List" => "DataImpl",
            "String" => "StringImpl",
            _ => &self.0,
        };

        DartType(res.to_string())
    }
}
impl Display for DartType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.0)
    }
}

/// Represents a Dart function or method.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartFunction {
    pub name: String,
    pub is_public: bool,
    pub is_static: bool,
    pub has_finally: bool,
    pub params: Vec<DartVariable>,
    pub operations: Vec<DartOperation>,
    pub defined_vars: Vec<DartVariable>,
    #[serde(rename = "return")]
    pub return_type: DartReturn,
    pub comments: Vec<String>,
}

/// Represents a Dart property of a struct/class or enum.
#[derive(Debug, Clone, Serialize, Deserialize)]
struct DartProperty {
    pub name: String,
    pub is_public: bool,
    pub is_override: bool,
    pub operations: Vec<DartOperation>,
    #[serde(rename = "return")]
    pub return_type: DartReturn,
    pub comments: Vec<String>,
}

/// The operation to be interpreted by the templating engine. This handles
/// parameters and C FFI calls in an appropriate way, depending on context.
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
#[serde(rename_all = "snake_case")]
pub enum DartOperation {
    // Results in:
    // ```dart
    // final <var_name> = <call>;
    // ```
    Call {
        var_name: String,
        call: String,
        is_final: bool,  // Is final variable.
        core_var_name: Option<String>,
    },
    // Results in:
    // ```dart
    // StringImpl? alphabetString;
    // if alphabet != null {
    //     <call_var_name> = StringImpl.createWithString(core, string);
    // }
    // final alphabetStringPtr = alphabetString?.pointer ?? nullptr;
    // ```
    CallOptional {
        param_name: String,
        var_name: String,
        call_var_name: String,
        var_type: String,
        call: String,
        is_final: bool,  // Is final variable.
        core_var_name: Option<String>,
    },
    // Results in:
    // ```Dart
    // final <var_name> = <call>;
    // if <var_name> == null {
    //     return null;
    // }
    // ```
    GuardedCall {
        var_name: String,
        call: String,
        core_var_name: Option<String>,
    },
    // Results in:
    // ```dart
    //  <call>(<var_name>);
    DeferCall {
        var_name: String,
        call: String,
        core_var_name: Option<String>,
    },
    // Results in:
    // ```dart
    // return <call>;
    // ```
    Return {
        call: String,
    },
    // Results in:
    // ```dart
    // final wrapper = <call>;
    // final val = wrapper.<get_method>;
    // wrapper.dispose();
    // return val;
    // ```
    ReturnWithDispose {
        call: String,
        get_method: String,
    },
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartVariable {
    pub name: String,
    pub local_name: String,
    pub call_name: String,
    #[serde(rename = "type")]
    pub var_type: DartType,
    pub is_nullable: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartReturn {
    #[serde(rename = "type")]
    pub var_type: DartType,
    pub is_nullable: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartInit {
    pub name: String,
    pub class_name: String,
    pub is_nullable: bool,
    pub is_public: bool,
    pub has_finally: bool,
    pub params: Vec<DartVariable>,
    pub operations: Vec<DartOperation>,
    pub defined_vars: Vec<DartVariable>,
    pub comments: Vec<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DartOperatorEquality {
    pub c_ffi_name: String,
}

/// Used for the individual `process_*` functions.
enum ObjectVariant<'a> {
    Struct(&'a str),
    Enum(&'a str),
}

impl<'a> ObjectVariant<'a> {
    fn name(&'a self) -> &'a str {
        match self {
            ObjectVariant::Struct(n) | ObjectVariant::Enum(n) => n,
        }
    }
}

/// Convert the `TypeVariant` into the appropriate Dart type.
impl From<TypeVariant> for DartType {
    fn from(value: TypeVariant) -> Self {
        let res = match value {
            TypeVariant::Void => "void".to_string(),
            TypeVariant::Bool => "bool".to_string(),
            TypeVariant::Char => "int".to_string(),
            TypeVariant::ShortInt => "int".to_string(),
            TypeVariant::Int => "int".to_string(),
            TypeVariant::UnsignedInt => "int".to_string(),
            TypeVariant::LongInt => "int".to_string(),
            TypeVariant::Float => "double".to_string(),
            TypeVariant::Double => "double".to_string(),
            TypeVariant::SizeT => "int".to_string(),
            TypeVariant::Int8T => "int".to_string(),
            TypeVariant::Int16T => "int".to_string(),
            TypeVariant::Int32T => "int".to_string(),
            TypeVariant::Int64T => "int".to_string(),
            TypeVariant::UInt8T => "int".to_string(),
            TypeVariant::UInt16T => "int".to_string(),
            TypeVariant::UInt32T => "int".to_string(),
            TypeVariant::UInt64T => "int".to_string(),
            TypeVariant::String => "String".to_string(),
            TypeVariant::Data => "Uint8List".to_string(),
            TypeVariant::Struct(n) => {
                // We strip the "TW" prefix for Dart representations of
                // structs/enums.
                n.strip_prefix("TW").map(|n| n.to_string()).unwrap_or(n)
            }
            TypeVariant::Enum(n) => n
        };

        DartType(res)
    }
}
