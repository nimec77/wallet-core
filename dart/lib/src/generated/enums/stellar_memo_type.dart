// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum StellarMemoType {
  none(0),
  text(1),
  id(2),
  hash(3),
  returnValue(4);

  final int value;

  const StellarMemoType(this.value);

  static StellarMemoType fromValue(int value) => switch (value) {
        0 => none,
        1 => text,
        2 => id,
        3 => hash,
        4 => returnValue,
        _ => throw ArgumentError("Unknown value for StellarMemoType: $value"),
      };
}
