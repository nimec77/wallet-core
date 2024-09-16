// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class Base64 {

  static Uint8List? decode({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWBase64Decode(stringString.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithData(result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      stringString.dispose();
    }
  }

  static Uint8List? decodeUrl({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWBase64DecodeUrl(stringString.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithData(result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      stringString.dispose();
    }
  }

  static String encode({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWBase64Encode(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String encodeUrl({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWBase64EncodeUrl(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

}
