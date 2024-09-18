// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class AnyAddress implements Disposable, Address {
  final Pointer<TWAnyAddress> _pointer;

  Pointer<TWAnyAddress> get pointer => _pointer;

  const AnyAddress._(Pointer<TWAnyAddress> pointer) : _pointer = pointer;

  @override
  bool operator ==(Object other) => switch (other) {
        AnyAddress obj => _bindings.TWAnyAddressEqual(_pointer, obj.pointer),
        _ => false,
      };

  @override
  int get hashCode => _pointer.hashCode;

  factory AnyAddress.createWithString({
    required String string,
    required CoinType coin,
  }) {
    final stringString = StringImpl.createWithString(string);
    final coinEnum = TWCoinType.fromValue(coin.value);
    try {
      final result = _bindings.TWAnyAddressCreateWithString(stringString.pointer, coinEnum);
      if (result == nullptr) {
        throw ArgumentError('AnyAddress.createWithString: string=$string, coin=$coin');
      }

      return AnyAddress._(result);
    } finally {
      stringString.dispose();
    }
  }

  factory AnyAddress.createBech32({
    required String string,
    required CoinType coin,
    required String hrp,
  }) {
    final stringString = StringImpl.createWithString(string);
    final coinEnum = TWCoinType.fromValue(coin.value);
    final hrpString = StringImpl.createWithString(hrp);
    try {
      final result = _bindings.TWAnyAddressCreateBech32(stringString.pointer, coinEnum, hrpString.pointer);
      if (result == nullptr) {
        throw ArgumentError('AnyAddress.createBech32: string=$string, coin=$coin, hrp=$hrp');
      }

      return AnyAddress._(result);
    } finally {
      stringString.dispose();
      hrpString.dispose();
    }
  }

  factory AnyAddress.createSs58({
    required String string,
    required CoinType coin,
    required int ss58Prefix,
  }) {
    final stringString = StringImpl.createWithString(string);
    final coinEnum = TWCoinType.fromValue(coin.value);
    try {
      final result = _bindings.TWAnyAddressCreateSS58(stringString.pointer, coinEnum, ss58Prefix);
      if (result == nullptr) {
        throw ArgumentError('AnyAddress.createSs58: string=$string, coin=$coin, ss58Prefix=$ss58Prefix');
      }

      return AnyAddress._(result);
    } finally {
      stringString.dispose();
    }
  }

  factory AnyAddress.createWithPublicKey({
    required PublicKey publicKey,
    required CoinType coin,
  }) {
    final publicKeyPublicKey = publicKey.pointer;
    final coinEnum = TWCoinType.fromValue(coin.value);
    final result = _bindings.TWAnyAddressCreateWithPublicKey(publicKeyPublicKey, coinEnum);

    return AnyAddress._(result);
  }

  factory AnyAddress.createWithPublicKeyDerivation({
    required PublicKey publicKey,
    required CoinType coin,
    required Derivation derivation,
  }) {
    final publicKeyPublicKey = publicKey.pointer;
    final coinEnum = TWCoinType.fromValue(coin.value);
    final derivationEnum = TWDerivation.fromValue(derivation.value);
    final result = _bindings.TWAnyAddressCreateWithPublicKeyDerivation(publicKeyPublicKey, coinEnum, derivationEnum);

    return AnyAddress._(result);
  }

  factory AnyAddress.createBech32WithPublicKey({
    required PublicKey publicKey,
    required CoinType coin,
    required String hrp,
  }) {
    final publicKeyPublicKey = publicKey.pointer;
    final coinEnum = TWCoinType.fromValue(coin.value);
    final hrpString = StringImpl.createWithString(hrp);
    final result = _bindings.TWAnyAddressCreateBech32WithPublicKey(publicKeyPublicKey, coinEnum, hrpString.pointer);
    hrpString.dispose();

    return AnyAddress._(result);
  }

  factory AnyAddress.createSs58WithPublicKey({
    required PublicKey publicKey,
    required CoinType coin,
    required int ss58Prefix,
  }) {
    final publicKeyPublicKey = publicKey.pointer;
    final coinEnum = TWCoinType.fromValue(coin.value);
    final result = _bindings.TWAnyAddressCreateSS58WithPublicKey(publicKeyPublicKey, coinEnum, ss58Prefix);

    return AnyAddress._(result);
  }

  factory AnyAddress.createWithPublicKeyFilecoinAddressType({
    required PublicKey publicKey,
    required FilecoinAddressType filecoinAddressType,
  }) {
    final publicKeyPublicKey = publicKey.pointer;
    final filecoinAddressTypeEnum = TWFilecoinAddressType.fromValue(filecoinAddressType.value);
    final result = _bindings.TWAnyAddressCreateWithPublicKeyFilecoinAddressType(
      publicKeyPublicKey,
      filecoinAddressTypeEnum,
    );

    return AnyAddress._(result);
  }

  @override
  void dispose() {
    _bindings.TWAnyAddressDelete(pointer);
  }

  static bool isValid({
    required String string,
    required CoinType coin,
  }) {
    final stringString = StringImpl.createWithString(string);
    final coinEnum = TWCoinType.fromValue(coin.value);
    final result = _bindings.TWAnyAddressIsValid(stringString.pointer, coinEnum);
    stringString.dispose();

    return result;
  }

  static bool isValidBech32({
    required String string,
    required CoinType coin,
    required String hrp,
  }) {
    final stringString = StringImpl.createWithString(string);
    final coinEnum = TWCoinType.fromValue(coin.value);
    final hrpString = StringImpl.createWithString(hrp);
    final result = _bindings.TWAnyAddressIsValidBech32(stringString.pointer, coinEnum, hrpString.pointer);
    stringString.dispose();
    hrpString.dispose();

    return result;
  }

  static bool isValidSs58({
    required String string,
    required CoinType coin,
    required int ss58Prefix,
  }) {
    final stringString = StringImpl.createWithString(string);
    final coinEnum = TWCoinType.fromValue(coin.value);
    final result = _bindings.TWAnyAddressIsValidSS58(stringString.pointer, coinEnum, ss58Prefix);
    stringString.dispose();

    return result;
  }

  @override
  String get description {
    final obj = pointer;
    final result = _bindings.TWAnyAddressDescription(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  CoinType get coin {
    final obj = pointer;
    final result = _bindings.TWAnyAddressCoin(obj);

    return CoinType.fromValue(result.value);
  }

  Uint8List get data {
    final obj = pointer;
    final result = _bindings.TWAnyAddressData(obj);
    final wrapper = DataImpl.createWithPointer(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
}
