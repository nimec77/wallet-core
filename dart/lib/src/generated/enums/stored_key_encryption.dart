// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum StoredKeyEncryption {
  aes128Ctr(0),
  aes128Cbc(1),
  aes192Ctr(2),
  aes256Ctr(3);

  final int value;

  const StoredKeyEncryption(this.value);

  static StoredKeyEncryption fromValue(int value) => switch (value) {
        0 => aes128Ctr,
        1 => aes128Cbc,
        2 => aes192Ctr,
        3 => aes256Ctr,
        _ => throw ArgumentError("Unknown value for StoredKeyEncryption: $value"),
      };
}
