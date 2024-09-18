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

  factory PrivateKey.createWithData({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    try {
      final result = _bindings.TWPrivateKeyCreateWithData(dataUint8List.pointer);
      if (result == nullptr) {
        throw ArgumentError('PrivateKey.createWithData: data=$data');
      }

      return PrivateKey._(result);
    } finally {
      dataUint8List.dispose();
    }
  }

  factory PrivateKey.createCopy({
    required PrivateKey key,
  }) {
    final keyPrivateKey = key.pointer;
    final result = _bindings.TWPrivateKeyCreateCopy(keyPrivateKey);
    if (result == nullptr) {
      throw ArgumentError('PrivateKey.createCopy: key=$key');
    }

    return PrivateKey._(result);
  }

  @override
  void dispose() {
    _bindings.TWPrivateKeyDelete(pointer);
  }

  static bool isValid({
    required Uint8List data,
    required Curve curve,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final curveEnum = TWCurve.fromValue(curve.value);
    final result = _bindings.TWPrivateKeyIsValid(dataUint8List.pointer, curveEnum);
    dataUint8List.dispose();

    return result;
  }

  PublicKey getPublicKey({
    required CoinType coinType,
  }) {
    final obj = pointer;
    final coinTypeEnum = TWCoinType.fromValue(coinType.value);
    final result = _bindings.TWPrivateKeyGetPublicKey(obj, coinTypeEnum);

    return PublicKey._(result);
  }

  PublicKey getPublicKeyByType({
    required PublicKeyType pubkeyType,
  }) {
    final obj = pointer;
    final pubkeyTypeEnum = TWPublicKeyType.fromValue(pubkeyType.value);
    final result = _bindings.TWPrivateKeyGetPublicKeyByType(obj, pubkeyTypeEnum);

    return PublicKey._(result);
  }

  PublicKey getPublicKeySecp256k1({
    required bool compressed,
  }) {
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

  Uint8List? sign({
    required Uint8List digest,
    required Curve curve,
  }) {
    final obj = pointer;
    final digestUint8List = DataImpl.createWithBytes(digest);
    final curveEnum = TWCurve.fromValue(curve.value);
    try {
      final result = _bindings.TWPrivateKeySign(obj, digestUint8List.pointer, curveEnum);
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

  Uint8List? signAsDer({
    required Uint8List digest,
  }) {
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

  Uint8List? signZilliqaSchnorr({
    required Uint8List message,
  }) {
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
    final wrapper = DataImpl(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
}
