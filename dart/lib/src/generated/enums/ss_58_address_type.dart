// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum SS58AddressType {
  polkadot(0),
  kusama(2);

  final int value;

  const SS58AddressType(this.value);

  static SS58AddressType fromValue(int value) => switch (value) {
    0 => polkadot,
    2 => kusama,
    _ => throw ArgumentError("Unknown value for SS58AddressType: $value"),
  };
}
