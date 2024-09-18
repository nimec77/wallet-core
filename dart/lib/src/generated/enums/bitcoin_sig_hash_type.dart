// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum BitcoinSigHashType {
  all(0x01),
  none(0x02),
  single(0x03),
  fork(0x40),
  forkBtg(0x4f40),
  anyoneCanPay(0x80);

  final int value;

  const BitcoinSigHashType(this.value);

  static BitcoinSigHashType fromValue(int value) => switch (value) {
        0x01 => all,
        0x02 => none,
        0x03 => single,
        0x40 => fork,
        0x4f40 => forkBtg,
        0x80 => anyoneCanPay,
        _ => throw ArgumentError("Unknown value for BitcoinSigHashType: $value"),
      };

  bool isSingle() {
    final obj = TWBitcoinSigHashType.fromValue(value);
    final result = _bindings.TWBitcoinSigHashTypeIsSingle(obj);

    return result;
  }

  bool isNone() {
    final obj = TWBitcoinSigHashType.fromValue(value);
    final result = _bindings.TWBitcoinSigHashTypeIsNone(obj);

    return result;
  }
}
