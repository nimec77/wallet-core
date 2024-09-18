// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class PBKDF2 {
  static Uint8List? hmacSha256({
    required Uint8List password,
    required Uint8List salt,
    required int iterations,
    required int dkLen,
  }) {
    final passwordUint8List = DataImpl.createWithBytes(password);
    final saltUint8List = DataImpl.createWithBytes(salt);
    try {
      final result = _bindings.TWPBKDF2HmacSha256(passwordUint8List.pointer, saltUint8List.pointer, iterations, dkLen);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithPointer(result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      passwordUint8List.dispose();
      saltUint8List.dispose();
    }
  }

  static Uint8List? hmacSha512({
    required Uint8List password,
    required Uint8List salt,
    required int iterations,
    required int dkLen,
  }) {
    final passwordUint8List = DataImpl.createWithBytes(password);
    final saltUint8List = DataImpl.createWithBytes(salt);
    try {
      final result = _bindings.TWPBKDF2HmacSha512(passwordUint8List.pointer, saltUint8List.pointer, iterations, dkLen);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithPointer(result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      passwordUint8List.dispose();
      saltUint8List.dispose();
    }
  }
}
