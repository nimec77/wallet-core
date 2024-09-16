// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum Derivation {
  defaultValue(0),
  custom(1),
  bitcoinSegwit(2),
  bitcoinLegacy(3),
  bitcoinTestnet(4),
  litecoinLegacy(5),
  solanaSolana(6);

  final int value;

  const Derivation(this.value);

  static Derivation fromValue(int value) => switch (value) {
        0 => defaultValue,
        1 => custom,
        2 => bitcoinSegwit,
        3 => bitcoinLegacy,
        4 => bitcoinTestnet,
        5 => litecoinLegacy,
        6 => solanaSolana,
        _ => throw ArgumentError("Unknown value for Derivation: $value"),
      };
}
