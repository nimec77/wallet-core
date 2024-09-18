// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class Base32 {

  static Uint8List? decodeWithAlphabet({
    required String string,
    required String? alphabet,
  }) {
    StringImpl? alphabetString;
    final stringString = StringImpl.createWithString(string);
    try {
      if (alphabet != null) {
        alphabetString = StringImpl.createWithString(alphabet);
      }
      final alphabetStringPtr = alphabetString?.pointer ?? nullptr;
      final result = _bindings.TWBase32DecodeWithAlphabet(stringString.pointer, alphabetStringPtr);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithPointer(result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      stringString.dispose();
      alphabetString?.dispose();
    }
  }

  static Uint8List? decode({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWBase32Decode(stringString.pointer);
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

  static String encodeWithAlphabet({
    required Uint8List data,
    required String? alphabet,
  }) {
    StringImpl? alphabetString;
    final dataUint8List = DataImpl.createWithBytes(data);
    if (alphabet != null) {
      alphabetString = StringImpl.createWithString(alphabet);
    }
    final alphabetStringPtr = alphabetString?.pointer ?? nullptr;
    final result = _bindings.TWBase32EncodeWithAlphabet(dataUint8List.pointer, alphabetStringPtr);
    dataUint8List.dispose();
    alphabetString?.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String encode({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWBase32Encode(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

}
