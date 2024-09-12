// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum Curve {
    secp256k1(0),
    ed25519(1),
    ed25519Blake2bNano(2),
    curve25519(3),
    nist256p1(4),
    ed25519ExtendedCardano(5),
    starkex(6);

    final int value;

    const Curve(this.value);

    static Curve fromValue(int value) => switch (value) {
        0 => secp256k1,
        1 => ed25519,
        2 => ed25519Blake2bNano,
        3 => curve25519,
        4 => nist256p1,
        5 => ed25519ExtendedCardano,
        6 => starkex,
        _ => throw ArgumentError("Unknown value for Curve: $value"),
    };

    String get description => switch (value) {
        0 => 'secp256k1',
        1 => 'ed25519',
        2 => 'ed25519-blake2b-nano',
        3 => 'curve25519',
        4 => 'nist256p1',
        5 => 'ed25519-cardano-seed',
        6 => 'starkex',
        _ => throw ArgumentError("Unknown value for Curve: $value"),
    };
}
