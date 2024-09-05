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
import 'package:trust_wallet_core/src/generated/public_key.dart';

final class PrivateKey implements Disposable {
  final TrustWalletCoreBindings _core;
  final Pointer<TWPrivateKey> _pointer;

  Pointer<TWPrivateKey> get pointer => _pointer;

  const PrivateKey(TrustWalletCoreBindings core, Pointer<TWPrivateKey> pointer)
      : _core = core,
        _pointer = pointer;

  factory PrivateKey.create(TrustWalletCoreBindings core) {
    final result = core.TWPrivateKeyCreate();

    return PrivateKey(core, result);
  }

  factory PrivateKey.createWithData(TrustWalletCoreBindings core, Uint8List data) {
    final dataUint8List = DataImpl.createWithBytes(core, data);
    try {
      final result = core.TWPrivateKeyCreateWithData(dataUint8List.pointer);
      if (result == nullptr) {
        throw ArgumentError('TWPrivateKeyCreateWithData(dataUint8List.pointer) returned null');
      }

      return PrivateKey(core, result);
    } finally {
      dataUint8List.dispose();
    }
  }

  factory PrivateKey.createCopy(TrustWalletCoreBindings core, PrivateKey key) {
    final keyPrivateKey = key.pointer;
    final result = core.TWPrivateKeyCreateCopy(keyPrivateKey);
    if (result == nullptr) {
      throw ArgumentError('TWPrivateKeyCreateCopy(keyPrivateKey) returned null');
    }

    return PrivateKey(core, result);
  }

  @override
  dispose() {
    _core.TWPrivateKeyDelete(pointer);
  }

  static bool isValid(TrustWalletCoreBindings core, Uint8List data, TWCurve curve) {
    final dataUint8List = DataImpl.createWithBytes(core, data);
    final result = core.TWPrivateKeyIsValid(dataUint8List.pointer, curve);
    dataUint8List.dispose();

    return result;
  }

  PublicKey getPublicKey(TWCoinType coinType) {
    final obj = pointer;
    final result = _core.TWPrivateKeyGetPublicKey(obj, coinType);

    return PublicKey(_core, result);
  }

  PublicKey getPublicKeyByType(TWPublicKeyType pubkeyType) {
    final obj = pointer;
    final result = _core.TWPrivateKeyGetPublicKeyByType(obj, pubkeyType);

    return PublicKey(_core, result);
  }

  PublicKey getPublicKeySecp256k1(bool compressed) {
    final obj = pointer;
    final result = _core.TWPrivateKeyGetPublicKeySecp256k1(obj, compressed);

    return PublicKey(_core, result);
  }

  PublicKey getPublicKeyNist256p1() {
    final obj = pointer;
    final result = _core.TWPrivateKeyGetPublicKeyNist256p1(obj);

    return PublicKey(_core, result);
  }

  PublicKey getPublicKeyEd25519() {
    final obj = pointer;
    final result = _core.TWPrivateKeyGetPublicKeyEd25519(obj);

    return PublicKey(_core, result);
  }

  PublicKey getPublicKeyEd25519Blake2b() {
    final obj = pointer;
    final result = _core.TWPrivateKeyGetPublicKeyEd25519Blake2b(obj);

    return PublicKey(_core, result);
  }

  PublicKey getPublicKeyEd25519Cardano() {
    final obj = pointer;
    final result = _core.TWPrivateKeyGetPublicKeyEd25519Cardano(obj);

    return PublicKey(_core, result);
  }

  PublicKey getPublicKeyCurve25519() {
    final obj = pointer;
    final result = _core.TWPrivateKeyGetPublicKeyCurve25519(obj);

    return PublicKey(_core, result);
  }

  //TODO: implement this
  // Uint8List? getSharedKey(PublicKey publicKey, TWCurve curve) {
  //   final obj = pointer;
  //   final publicKeyPublicKey = publicKey.pointer;
  //   final result = _core.TWPrivateKeyGetSharedKey(obj, publicKeyPublicKey, curve);
  //   if (result == nullptr) {
  //     return null;
  //   }
  //   final wrapper = DataImpl.createWithData(_core, result);
  //   final val = wrapper.bytes;
  //   wrapper.dispose();

  //   return val;
  // }

  Uint8List? sign(Uint8List digest, TWCurve curve) {
    final obj = pointer;
    final digestUint8List = DataImpl.createWithBytes(_core, digest);
    try {
      final result = _core.TWPrivateKeySign(obj, digestUint8List.pointer, curve);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithData(_core, result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      digestUint8List.dispose();
    }
  }

  Uint8List? signAsDer(Uint8List digest) {
    final obj = pointer;
    final digestUint8List = DataImpl.createWithBytes(_core, digest);
    try {
      final result = _core.TWPrivateKeySignAsDER(obj, digestUint8List.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithData(_core, result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      digestUint8List.dispose();
    }
  }

  Uint8List? signZilliqaSchnorr(Uint8List message) {
    final obj = pointer;
    final messageUint8List = DataImpl.createWithBytes(_core, message);
    try {
      final result = _core.TWPrivateKeySignZilliqaSchnorr(obj, messageUint8List.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithData(_core, result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      messageUint8List.dispose();
    }
  }

  Uint8List get data {
    final obj = pointer;
    final result = _core.TWPrivateKeyData(obj);
    final wrapper = DataImpl.createWithData(_core, result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
}
