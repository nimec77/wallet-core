// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum StellarVersionByte {
  accountId(0x30),
  seed(0xc0),
  preAuthTx(0xc8),
  sha256Hash(0x118);

  final int value;

  const StellarVersionByte(this.value);

  static StellarVersionByte fromValue(int value) => switch (value) {
    0x30 => accountId,
    0xc0 => seed,
    0xc8 => preAuthTx,
    0x118 => sha256Hash,
    _ => throw ArgumentError("Unknown value for StellarVersionByte: $value"),
  };
}
