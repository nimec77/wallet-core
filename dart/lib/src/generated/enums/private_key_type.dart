// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum PrivateKeyType {
    defaultValue(0),
    cardano(1);

    final int value;

    const PrivateKeyType(this.value);

    static PrivateKeyType fromValue(int value) => switch (value) {
        0 => defaultValue,
        1 => cardano,
        _ => throw ArgumentError("Unknown value for PrivateKeyType: $value"),
    };
}
