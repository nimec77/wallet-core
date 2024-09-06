// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class PrivateKey implements Disposable {
  final Pointer<TWPrivateKey> _pointer;

  Pointer<TWPrivateKey> get pointer => _pointer;

  const PrivateKey._(Pointer<TWPrivateKey> pointer) : _pointer = pointer;

  factory PrivateKey.create() {
    final result = _bindings.TWPrivateKeyCreate();

    return PrivateKey._(result);
  }

  factory PrivateKey.createWithData(Uint8List data) {
    final dataUint8List = DataImpl.createWithBytes(data);
    try {
      final result = _bindings.TWPrivateKeyCreateWithData(dataUint8List.pointer);
      if (result == nullptr) {
        throw ArgumentError('TWPrivateKeyCreateWithData(dataUint8List.pointer) returned null');
      }

      return PrivateKey._(result);
    } finally {
      dataUint8List.dispose();
    }
  }

  factory PrivateKey.createCopy(PrivateKey key) {
    final keyPrivateKey = key.pointer;
    final result = _bindings.TWPrivateKeyCreateCopy(keyPrivateKey);
    if (result == nullptr) {
      throw ArgumentError('TWPrivateKeyCreateCopy(keyPrivateKey) returned null');
    }

    return PrivateKey._(result);
  }

  @override
  dispose() {
    _bindings.TWPrivateKeyDelete(pointer);
  }

  static bool isValid(Uint8List data, TWCurve curve) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWPrivateKeyIsValid(dataUint8List.pointer, curve);
    dataUint8List.dispose();

    return result;
  }

  PublicKey getPublicKey(TWCoinType coinType) {
    final obj = pointer;
    final result = _bindings.TWPrivateKeyGetPublicKey(obj, coinType);

    return PublicKey._(result);
  }

  PublicKey getPublicKeyByType(TWPublicKeyType pubkeyType) {
    final obj = pointer;
    final result = _bindings.TWPrivateKeyGetPublicKeyByType(obj, pubkeyType);

    return PublicKey._(result);
  }

  PublicKey getPublicKeySecp256k1(bool compressed) {
    final obj = pointer;
    final result = _bindings.TWPrivateKeyGetPublicKeySecp256k1(obj, compressed);

    return PublicKey._(result);
  }

  PublicKey getPublicKeyNist256p1() {
    final obj = pointer;
    final result = _bindings.TWPrivateKeyGetPublicKeyNist256p1(obj);

    return PublicKey._(result);
  }

  PublicKey getPublicKeyEd25519() {
    final obj = pointer;
    final result = _bindings.TWPrivateKeyGetPublicKeyEd25519(obj);

    return PublicKey._(result);
  }

  PublicKey getPublicKeyEd25519Blake2b() {
    final obj = pointer;
    final result = _bindings.TWPrivateKeyGetPublicKeyEd25519Blake2b(obj);

    return PublicKey._(result);
  }

  PublicKey getPublicKeyEd25519Cardano() {
    final obj = pointer;
    final result = _bindings.TWPrivateKeyGetPublicKeyEd25519Cardano(obj);

    return PublicKey._(result);
  }

  PublicKey getPublicKeyCurve25519() {
    final obj = pointer;
    final result = _bindings.TWPrivateKeyGetPublicKeyCurve25519(obj);

    return PublicKey._(result);
  }

  Uint8List? sign(Uint8List digest, TWCurve curve) {
    final obj = pointer;
    final digestUint8List = DataImpl.createWithBytes(digest);
    try {
      final result = _bindings.TWPrivateKeySign(obj, digestUint8List.pointer, curve);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithData(result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      digestUint8List.dispose();
    }
  }

  Uint8List? signAsDer(Uint8List digest) {
    final obj = pointer;
    final digestUint8List = DataImpl.createWithBytes(digest);
    try {
      final result = _bindings.TWPrivateKeySignAsDER(obj, digestUint8List.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithData(result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      digestUint8List.dispose();
    }
  }

  Uint8List? signZilliqaSchnorr(Uint8List message) {
    final obj = pointer;
    final messageUint8List = DataImpl.createWithBytes(message);
    try {
      final result = _bindings.TWPrivateKeySignZilliqaSchnorr(obj, messageUint8List.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithData(result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      messageUint8List.dispose();
    }
  }

  Uint8List get data {
    final obj = pointer;
    final result = _bindings.TWPrivateKeyData(obj);
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
}
