// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

import 'dart:ffi';
import 'dart:typed_data';

import 'package:trust_wallet_core/src/bindings/generated_bindings.dart';
import 'package:trust_wallet_core/src/common/abstractions.dart';
import 'package:trust_wallet_core/src/common/data_impl.dart';
import 'package:trust_wallet_core/src/common/string_impl.dart';

final class PublicKey implements Disposable {
  final TrustWalletCoreBindings _core;
  final Pointer<TWPublicKey> _pointer;

  Pointer<TWPublicKey> get pointer => _pointer;

  const PublicKey(TrustWalletCoreBindings core, Pointer<TWPublicKey> pointer)
      : _core = core,
        _pointer = pointer;

  factory PublicKey.createWithData(TrustWalletCoreBindings core, Uint8List data, TWPublicKeyType type) {
    final dataUint8List = DataImpl.createWithBytes(core, data);
    try {
      final result = core.TWPublicKeyCreateWithData(dataUint8List.pointer, type);
      if (result == nullptr) {
        throw ArgumentError('TWPublicKeyCreateWithData(dataUint8List.pointer, type) returned null');
      }

      return PublicKey(core, result);
    } finally {
      dataUint8List.dispose();
    }
  }

  @override
  dispose() {
    _core.TWPublicKeyDelete(pointer);
  }

  static bool isValid(TrustWalletCoreBindings core, Uint8List data, TWPublicKeyType type) {
    final dataUint8List = DataImpl.createWithBytes(core, data);
    final result = core.TWPublicKeyIsValid(dataUint8List.pointer, type);
    dataUint8List.dispose();

    return result;
  }

  bool verify(Uint8List signature, Uint8List message) {
    final obj = pointer;
    final signatureUint8List = DataImpl.createWithBytes(_core, signature);
    final messageUint8List = DataImpl.createWithBytes(_core, message);
    final result = _core.TWPublicKeyVerify(obj, signatureUint8List.pointer, messageUint8List.pointer);
    signatureUint8List.dispose();
    messageUint8List.dispose();

    return result;
  }

  bool verifyAsDER(Uint8List signature, Uint8List message) {
    final obj = pointer;
    final signatureUint8List = DataImpl.createWithBytes(_core, signature);
    final messageUint8List = DataImpl.createWithBytes(_core, message);
    final result = _core.TWPublicKeyVerifyAsDER(obj, signatureUint8List.pointer, messageUint8List.pointer);
    signatureUint8List.dispose();
    messageUint8List.dispose();

    return result;
  }

  bool verifyZilliqaSchnorr(Uint8List signature, Uint8List message) {
    final obj = pointer;
    final signatureUint8List = DataImpl.createWithBytes(_core, signature);
    final messageUint8List = DataImpl.createWithBytes(_core, message);
    final result = _core.TWPublicKeyVerifyZilliqaSchnorr(obj, signatureUint8List.pointer, messageUint8List.pointer);
    signatureUint8List.dispose();
    messageUint8List.dispose();

    return result;
  }

  static PublicKey? recover(TrustWalletCoreBindings core, Uint8List signature, Uint8List message) {
    final signatureUint8List = DataImpl.createWithBytes(core, signature);
    final messageUint8List = DataImpl.createWithBytes(core, message);
    try {
      final result = core.TWPublicKeyRecover(signatureUint8List.pointer, messageUint8List.pointer);
      if (result == nullptr) {
        return null;
      }

      return PublicKey(core, result);
    } finally {
      signatureUint8List.dispose();
      messageUint8List.dispose();
    }
  }

  bool get isCompressed {
    final obj = pointer;
    final result = _core.TWPublicKeyIsCompressed(obj);

    return result;
  }

  PublicKey get compressed {
    final obj = pointer;
    final result = _core.TWPublicKeyCompressed(obj);

    return PublicKey(_core, result);
  }

  PublicKey get uncompressed {
    final obj = pointer;
    final result = _core.TWPublicKeyUncompressed(obj);

    return PublicKey(_core, result);
  }

  Uint8List get data {
    final obj = pointer;
    final result = _core.TWPublicKeyData(obj);
    final wrapper = DataImpl.createWithData(_core, result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  TWPublicKeyType get keyType {
    final obj = pointer;
    final result = _core.TWPublicKeyKeyType(obj);

    return TWPublicKeyType.fromValue(result.value);
  }

  String get description {
    final obj = pointer;
    final result = _core.TWPublicKeyDescription(obj);
    final wrapper = StringImpl.createWithPointer(_core, result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
}
