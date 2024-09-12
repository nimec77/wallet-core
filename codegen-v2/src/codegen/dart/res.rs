use std::collections::HashMap;
use std::sync::LazyLock;

pub const TRUST_WALLET_PACKAGE_PATH: &str = "package:trust_wallet_core";
pub const STRING_WRAPPER_CLASS: &str = "StringImpl";
pub const DATA_WRAPPER_CLASS: &str = "DataImpl";

pub const ENUM_VALUE_TYPE: &str = "int";
pub const CORE_VAR_NAME: &str = "_bindings";

pub static REPLACED_MAP: LazyLock<HashMap<&str, &str>> = LazyLock::new(|| {
    HashMap::from([
        ("default", "defaultValue"),
        ("return", "returnValue"),
        ("base", "baseValue"),
    ])
});
