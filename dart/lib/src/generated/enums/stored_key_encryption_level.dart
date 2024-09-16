// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum StoredKeyEncryptionLevel {
  defaultValue(0),
  minimal(1),
  weak(2),
  standard(3);

  final int value;

  const StoredKeyEncryptionLevel(this.value);

  static StoredKeyEncryptionLevel fromValue(int value) => switch (value) {
    0 => defaultValue,
    1 => minimal,
    2 => weak,
    3 => standard,
    _ => throw ArgumentError("Unknown value for StoredKeyEncryptionLevel: $value"),
  };
}
