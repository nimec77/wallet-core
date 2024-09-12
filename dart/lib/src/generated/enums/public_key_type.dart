// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum PublicKeyType {
    secp256k1(0),
    secp256k1Extended(1),
    nist256p1(2),
    nist256p1Extended(3),
    ed25519(4),
    ed25519Blake2b(5),
    curve25519(6),
    ed25519Cardano(7),
    starkex(8);

    final int value;

    const PublicKeyType(this.value);

    static PublicKeyType fromValue(int value) => switch (value) {
        0 => secp256k1,
        1 => secp256k1Extended,
        2 => nist256p1,
        3 => nist256p1Extended,
        4 => ed25519,
        5 => ed25519Blake2b,
        6 => curve25519,
        7 => ed25519Cardano,
        8 => starkex,
        _ => throw ArgumentError("Unknown value for PublicKeyType: $value"),
    };
}
