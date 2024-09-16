// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum Purpose {
  bip44(44),
  bip49(49),
  bip84(84),
  bip1852(1852);

  final int value;

  const Purpose(this.value);

  static Purpose fromValue(int value) => switch (value) {
        44 => bip44,
        49 => bip49,
        84 => bip84,
        1852 => bip1852,
        _ => throw ArgumentError("Unknown value for Purpose: $value"),
      };
}
