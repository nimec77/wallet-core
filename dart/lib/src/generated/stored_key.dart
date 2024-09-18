// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class StoredKey implements Disposable {
  final Pointer<TWStoredKey> _pointer;

  Pointer<TWStoredKey> get pointer => _pointer;

  const StoredKey._(Pointer<TWStoredKey> pointer) : _pointer = pointer;

  factory StoredKey.createLevel({
    required String name,
    required Uint8List password,
    required StoredKeyEncryptionLevel encryptionLevel,
  }) {
    final nameString = StringImpl.createWithString(name);
    final passwordUint8List = DataImpl.createWithBytes(password);
    final encryptionLevelEnum = TWStoredKeyEncryptionLevel.fromValue(encryptionLevel.value);
    final result = _bindings.TWStoredKeyCreateLevel(nameString.pointer, passwordUint8List.pointer, encryptionLevelEnum);
    nameString.dispose();
    passwordUint8List.dispose();

    return StoredKey._(result);
  }

  factory StoredKey.createLevelAndEncryption({
    required String name,
    required Uint8List password,
    required StoredKeyEncryptionLevel encryptionLevel,
    required StoredKeyEncryption encryption,
  }) {
    final nameString = StringImpl.createWithString(name);
    final passwordUint8List = DataImpl.createWithBytes(password);
    final encryptionLevelEnum = TWStoredKeyEncryptionLevel.fromValue(encryptionLevel.value);
    final encryptionEnum = TWStoredKeyEncryption.fromValue(encryption.value);
    final result = _bindings.TWStoredKeyCreateLevelAndEncryption(
      nameString.pointer,
      passwordUint8List.pointer,
      encryptionLevelEnum,
      encryptionEnum,
    );
    nameString.dispose();
    passwordUint8List.dispose();

    return StoredKey._(result);
  }

  factory StoredKey.create({
    required String name,
    required Uint8List password,
  }) {
    final nameString = StringImpl.createWithString(name);
    final passwordUint8List = DataImpl.createWithBytes(password);
    final result = _bindings.TWStoredKeyCreate(nameString.pointer, passwordUint8List.pointer);
    nameString.dispose();
    passwordUint8List.dispose();

    return StoredKey._(result);
  }

  factory StoredKey.createEncryption({
    required String name,
    required Uint8List password,
    required StoredKeyEncryption encryption,
  }) {
    final nameString = StringImpl.createWithString(name);
    final passwordUint8List = DataImpl.createWithBytes(password);
    final encryptionEnum = TWStoredKeyEncryption.fromValue(encryption.value);
    final result = _bindings.TWStoredKeyCreateEncryption(nameString.pointer, passwordUint8List.pointer, encryptionEnum);
    nameString.dispose();
    passwordUint8List.dispose();

    return StoredKey._(result);
  }

  @override
  void dispose() {
    _bindings.TWStoredKeyDelete(pointer);
  }

  static StoredKey? load({
    required String path,
  }) {
    final pathString = StringImpl.createWithString(path);
    try {
      final result = _bindings.TWStoredKeyLoad(pathString.pointer);
      if (result == nullptr) {
        return null;
      }

      return StoredKey._(result);
    } finally {
      pathString.dispose();
    }
  }

  static StoredKey? importPrivateKey({
    required Uint8List privateKey,
    required String name,
    required Uint8List password,
    required CoinType coin,
  }) {
    final privateKeyUint8List = DataImpl.createWithBytes(privateKey);
    final nameString = StringImpl.createWithString(name);
    final passwordUint8List = DataImpl.createWithBytes(password);
    final coinEnum = TWCoinType.fromValue(coin.value);
    try {
      final result = _bindings.TWStoredKeyImportPrivateKey(
        privateKeyUint8List.pointer,
        nameString.pointer,
        passwordUint8List.pointer,
        coinEnum,
      );
      if (result == nullptr) {
        return null;
      }

      return StoredKey._(result);
    } finally {
      privateKeyUint8List.dispose();
      nameString.dispose();
      passwordUint8List.dispose();
    }
  }

  static StoredKey? importPrivateKeyWithEncryption({
    required Uint8List privateKey,
    required String name,
    required Uint8List password,
    required CoinType coin,
    required StoredKeyEncryption encryption,
  }) {
    final privateKeyUint8List = DataImpl.createWithBytes(privateKey);
    final nameString = StringImpl.createWithString(name);
    final passwordUint8List = DataImpl.createWithBytes(password);
    final coinEnum = TWCoinType.fromValue(coin.value);
    final encryptionEnum = TWStoredKeyEncryption.fromValue(encryption.value);
    try {
      final result = _bindings.TWStoredKeyImportPrivateKeyWithEncryption(
        privateKeyUint8List.pointer,
        nameString.pointer,
        passwordUint8List.pointer,
        coinEnum,
        encryptionEnum,
      );
      if (result == nullptr) {
        return null;
      }

      return StoredKey._(result);
    } finally {
      privateKeyUint8List.dispose();
      nameString.dispose();
      passwordUint8List.dispose();
    }
  }

  static StoredKey? importHDWallet({
    required String mnemonic,
    required String name,
    required Uint8List password,
    required CoinType coin,
  }) {
    final mnemonicString = StringImpl.createWithString(mnemonic);
    final nameString = StringImpl.createWithString(name);
    final passwordUint8List = DataImpl.createWithBytes(password);
    final coinEnum = TWCoinType.fromValue(coin.value);
    try {
      final result = _bindings.TWStoredKeyImportHDWallet(
        mnemonicString.pointer,
        nameString.pointer,
        passwordUint8List.pointer,
        coinEnum,
      );
      if (result == nullptr) {
        return null;
      }

      return StoredKey._(result);
    } finally {
      mnemonicString.dispose();
      nameString.dispose();
      passwordUint8List.dispose();
    }
  }

  static StoredKey? importHDWalletWithEncryption({
    required String mnemonic,
    required String name,
    required Uint8List password,
    required CoinType coin,
    required StoredKeyEncryption encryption,
  }) {
    final mnemonicString = StringImpl.createWithString(mnemonic);
    final nameString = StringImpl.createWithString(name);
    final passwordUint8List = DataImpl.createWithBytes(password);
    final coinEnum = TWCoinType.fromValue(coin.value);
    final encryptionEnum = TWStoredKeyEncryption.fromValue(encryption.value);
    try {
      final result = _bindings.TWStoredKeyImportHDWalletWithEncryption(
        mnemonicString.pointer,
        nameString.pointer,
        passwordUint8List.pointer,
        coinEnum,
        encryptionEnum,
      );
      if (result == nullptr) {
        return null;
      }

      return StoredKey._(result);
    } finally {
      mnemonicString.dispose();
      nameString.dispose();
      passwordUint8List.dispose();
    }
  }

  static StoredKey? importJSON({
    required Uint8List json,
  }) {
    final jsonUint8List = DataImpl.createWithBytes(json);
    try {
      final result = _bindings.TWStoredKeyImportJSON(jsonUint8List.pointer);
      if (result == nullptr) {
        return null;
      }

      return StoredKey._(result);
    } finally {
      jsonUint8List.dispose();
    }
  }

  Account? account({
    required int index,
  }) {
    final obj = pointer;
    final result = _bindings.TWStoredKeyAccount(obj, index);
    if (result == nullptr) {
      return null;
    }

    return Account._(result);
  }

  Account? accountForCoin({
    required CoinType coin,
    required HDWallet? wallet,
  }) {
    final obj = pointer;
    final coinEnum = TWCoinType.fromValue(coin.value);
    final walletHdWallet = wallet?.pointer ?? nullptr;
    final result = _bindings.TWStoredKeyAccountForCoin(obj, coinEnum, walletHdWallet);
    if (result == nullptr) {
      return null;
    }

    return Account._(result);
  }

  Account? accountForCoinDerivation({
    required CoinType coin,
    required Derivation derivation,
    required HDWallet? wallet,
  }) {
    final obj = pointer;
    final coinEnum = TWCoinType.fromValue(coin.value);
    final derivationEnum = TWDerivation.fromValue(derivation.value);
    final walletHdWallet = wallet?.pointer ?? nullptr;
    final result = _bindings.TWStoredKeyAccountForCoinDerivation(obj, coinEnum, derivationEnum, walletHdWallet);
    if (result == nullptr) {
      return null;
    }

    return Account._(result);
  }

  void addAccountDerivation({
    required String address,
    required CoinType coin,
    required Derivation derivation,
    required String derivationPath,
    required String publicKey,
    required String extendedPublicKey,
  }) {
    final obj = pointer;
    final addressString = StringImpl.createWithString(address);
    final coinEnum = TWCoinType.fromValue(coin.value);
    final derivationEnum = TWDerivation.fromValue(derivation.value);
    final derivationPathString = StringImpl.createWithString(derivationPath);
    final publicKeyString = StringImpl.createWithString(publicKey);
    final extendedPublicKeyString = StringImpl.createWithString(extendedPublicKey);
    final result = _bindings.TWStoredKeyAddAccountDerivation(
      obj,
      addressString.pointer,
      coinEnum,
      derivationEnum,
      derivationPathString.pointer,
      publicKeyString.pointer,
      extendedPublicKeyString.pointer,
    );
    addressString.dispose();
    derivationPathString.dispose();
    publicKeyString.dispose();
    extendedPublicKeyString.dispose();

    return result;
  }

  void addAccount({
    required String address,
    required CoinType coin,
    required String derivationPath,
    required String publicKey,
    required String extendedPublicKey,
  }) {
    final obj = pointer;
    final addressString = StringImpl.createWithString(address);
    final coinEnum = TWCoinType.fromValue(coin.value);
    final derivationPathString = StringImpl.createWithString(derivationPath);
    final publicKeyString = StringImpl.createWithString(publicKey);
    final extendedPublicKeyString = StringImpl.createWithString(extendedPublicKey);
    final result = _bindings.TWStoredKeyAddAccount(
      obj,
      addressString.pointer,
      coinEnum,
      derivationPathString.pointer,
      publicKeyString.pointer,
      extendedPublicKeyString.pointer,
    );
    addressString.dispose();
    derivationPathString.dispose();
    publicKeyString.dispose();
    extendedPublicKeyString.dispose();

    return result;
  }

  void removeAccountForCoin({
    required CoinType coin,
  }) {
    final obj = pointer;
    final coinEnum = TWCoinType.fromValue(coin.value);
    final result = _bindings.TWStoredKeyRemoveAccountForCoin(obj, coinEnum);

    return result;
  }

  void removeAccountForCoinDerivation({
    required CoinType coin,
    required Derivation derivation,
  }) {
    final obj = pointer;
    final coinEnum = TWCoinType.fromValue(coin.value);
    final derivationEnum = TWDerivation.fromValue(derivation.value);
    final result = _bindings.TWStoredKeyRemoveAccountForCoinDerivation(obj, coinEnum, derivationEnum);

    return result;
  }

  void removeAccountForCoinDerivationPath({
    required CoinType coin,
    required String derivationPath,
  }) {
    final obj = pointer;
    final coinEnum = TWCoinType.fromValue(coin.value);
    final derivationPathString = StringImpl.createWithString(derivationPath);
    final result = _bindings.TWStoredKeyRemoveAccountForCoinDerivationPath(
      obj,
      coinEnum,
      derivationPathString.pointer,
    );
    derivationPathString.dispose();

    return result;
  }

  bool store({
    required String path,
  }) {
    final obj = pointer;
    final pathString = StringImpl.createWithString(path);
    final result = _bindings.TWStoredKeyStore(obj, pathString.pointer);
    pathString.dispose();

    return result;
  }

  Uint8List? decryptPrivateKey({
    required Uint8List password,
  }) {
    final obj = pointer;
    final passwordUint8List = DataImpl.createWithBytes(password);
    try {
      final result = _bindings.TWStoredKeyDecryptPrivateKey(obj, passwordUint8List.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = DataImpl.createWithPointer(result);
      final val = wrapper.bytes;
      wrapper.dispose();

      return val;
    } finally {
      passwordUint8List.dispose();
    }
  }

  String? decryptMnemonic({
    required Uint8List password,
  }) {
    final obj = pointer;
    final passwordUint8List = DataImpl.createWithBytes(password);
    try {
      final result = _bindings.TWStoredKeyDecryptMnemonic(obj, passwordUint8List.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = StringImpl.createWithPointer(result);
      final val = wrapper.dartString;
      wrapper.dispose();

      return val;
    } finally {
      passwordUint8List.dispose();
    }
  }

  PrivateKey? privateKey({
    required CoinType coin,
    required Uint8List password,
  }) {
    final obj = pointer;
    final coinEnum = TWCoinType.fromValue(coin.value);
    final passwordUint8List = DataImpl.createWithBytes(password);
    try {
      final result = _bindings.TWStoredKeyPrivateKey(obj, coinEnum, passwordUint8List.pointer);
      if (result == nullptr) {
        return null;
      }

      return PrivateKey._(result);
    } finally {
      passwordUint8List.dispose();
    }
  }

  HDWallet? wallet({
    required Uint8List password,
  }) {
    final obj = pointer;
    final passwordUint8List = DataImpl.createWithBytes(password);
    try {
      final result = _bindings.TWStoredKeyWallet(obj, passwordUint8List.pointer);
      if (result == nullptr) {
        return null;
      }

      return HDWallet._(result);
    } finally {
      passwordUint8List.dispose();
    }
  }

  Uint8List? exportJSON() {
    final obj = pointer;
    final result = _bindings.TWStoredKeyExportJSON(obj);
    if (result == nullptr) {
      return null;
    }
    final wrapper = DataImpl.createWithPointer(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  bool fixAddresses({
    required Uint8List password,
  }) {
    final obj = pointer;
    final passwordUint8List = DataImpl.createWithBytes(password);
    final result = _bindings.TWStoredKeyFixAddresses(obj, passwordUint8List.pointer);
    passwordUint8List.dispose();

    return result;
  }

  String? get identifier {
    final obj = pointer;
    final result = _bindings.TWStoredKeyIdentifier(obj);
    if (result == nullptr) {
      return null;
    }
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String get name {
    final obj = pointer;
    final result = _bindings.TWStoredKeyName(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  bool get isMnemonic {
    final obj = pointer;
    final result = _bindings.TWStoredKeyIsMnemonic(obj);

    return result;
  }

  int get accountCount {
    final obj = pointer;
    final result = _bindings.TWStoredKeyAccountCount(obj);

    return result;
  }

  String? get encryptionParameters {
    final obj = pointer;
    final result = _bindings.TWStoredKeyEncryptionParameters(obj);
    if (result == nullptr) {
      return null;
    }
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
}
