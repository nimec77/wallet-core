// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class EthereumAbi {

  static Uint8List encode({
    required EthereumAbiFunction fn,
  }) {
    final fnEthereumAbiFunction = fn.pointer;
    final result = _bindings.TWEthereumAbiEncode(fnEthereumAbiFunction);
    final wrapper = DataImpl.createWithPointer(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static bool decodeOutput({
    required EthereumAbiFunction fn,
    required Uint8List encoded,
  }) {
    final fnEthereumAbiFunction = fn.pointer;
    final encodedUint8List = DataImpl.createWithBytes(encoded);
    final result = _bindings.TWEthereumAbiDecodeOutput(fnEthereumAbiFunction, encodedUint8List.pointer);
    encodedUint8List.dispose();

    return result;
  }

  static String? decodeCall({
    required Uint8List data,
    required String abi,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final abiString = StringImpl.createWithString(abi);
    try {
      final result = _bindings.TWEthereumAbiDecodeCall(dataUint8List.pointer, abiString.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = StringImpl.createWithPointer(result);
      final val = wrapper.dartString;
      wrapper.dispose();

      return val;
    } finally {
      dataUint8List.dispose();
      abiString.dispose();
    }
  }

  static Uint8List encodeTyped({
    required String messageJson,
  }) {
    final messageJsonString = StringImpl.createWithString(messageJson);
    final result = _bindings.TWEthereumAbiEncodeTyped(messageJsonString.pointer);
    messageJsonString.dispose();
    final wrapper = DataImpl.createWithPointer(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

}
