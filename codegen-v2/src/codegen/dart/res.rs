use std::collections::HashMap;
use std::sync::LazyLock;

pub static REPLACED_MAP: LazyLock<HashMap<&str, &str>> = LazyLock::new(|| {
    HashMap::from([
        ("default", "defaultValue"),
        ("return", "returnValue"),
    ])
});

pub const TRUST_WALLET_PACKAGE_PATH: &str = "package:trust_wallet_core/src/";
