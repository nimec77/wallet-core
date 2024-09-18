// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class TransactionCompiler {
  static Uint8List preImageHashes({
    required CoinType coinType,
    required Uint8List txInputData,
  }) {
    final coinTypeEnum = TWCoinType.fromValue(coinType.value);
    final txInputDataUint8List = DataImpl.createWithBytes(txInputData);
    final result = _bindings.TWTransactionCompilerPreImageHashes(coinTypeEnum, txInputDataUint8List.pointer);
    txInputDataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List compileWithSignatures({
    required CoinType coinType,
    required Uint8List txInputData,
    required DataVector signatures,
    required DataVector publicKeys,
  }) {
    final coinTypeEnum = TWCoinType.fromValue(coinType.value);
    final txInputDataUint8List = DataImpl.createWithBytes(txInputData);
    final signaturesDataVector = signatures.pointer;
    final publicKeysDataVector = publicKeys.pointer;
    final result = _bindings.TWTransactionCompilerCompileWithSignatures(
      coinTypeEnum,
      txInputDataUint8List.pointer,
      signaturesDataVector,
      publicKeysDataVector,
    );
    txInputDataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
}
