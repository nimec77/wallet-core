// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum StellarPassphrase {
  stellar(0),
  kin(1);

  final int value;

  const StellarPassphrase(this.value);

  static StellarPassphrase fromValue(int value) => switch (value) {
    0 => stellar,
    1 => kin,
    _ => throw ArgumentError("Unknown value for StellarPassphrase: $value"),
  };

  String get description => switch (value) {
    0 => 'Public Global Stellar Network ; September 2015',
    1 => 'Kin Mainnet ; December 2018',
    _ => throw ArgumentError("Unknown value for StellarPassphrase: $value"),
  };
}
