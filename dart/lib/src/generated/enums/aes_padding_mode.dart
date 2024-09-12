// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum AESPaddingMode {
    zero(0),
    pkcs7(1);

    final int value;

    const AESPaddingMode(this.value);

    static AESPaddingMode fromValue(int value) => switch (value) {
        0 => zero,
        1 => pkcs7,
        _ => throw ArgumentError("Unknown value for AESPaddingMode: $value"),
    };
}
