// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class Base58 {

  static String encode({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWBase58Encode(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String encodeNoCheck({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWBase58EncodeNoCheck(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static Uint8List? decode({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWBase58Decode(stringString.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithPointer(result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      stringString.dispose();
    }
  }

  static Uint8List? decodeNoCheck({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWBase58DecodeNoCheck(stringString.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithPointer(result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      stringString.dispose();
    }
  }

}
