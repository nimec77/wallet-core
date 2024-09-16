// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum FilecoinAddressType {
  defaultValue(0),
  delegated(1);

  final int value;

  const FilecoinAddressType(this.value);

  static FilecoinAddressType fromValue(int value) => switch (value) {
    0 => defaultValue,
    1 => delegated,
    _ => throw ArgumentError("Unknown value for FilecoinAddressType: $value"),
  };
}
