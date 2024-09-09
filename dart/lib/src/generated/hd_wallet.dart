// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class HDWallet implements Disposable {
  final Pointer<TWHDWallet> _pointer;

  Pointer<TWHDWallet> get pointer => _pointer;

  //TODO: желательно сделать конструктор приватным
  const HDWallet._(Pointer<TWHDWallet> pointer) : _pointer = pointer;

  // HDWallet({int strength = 128, String passphrase = ""}) {
  // assert(strength >= 128 && strength <= 256 && strength % 32 == 0);
  factory HDWallet.create(int strength, String passphrase) {
    final passphraseString = StringImpl.createWithString(passphrase);
    try {
      final result = _bindings.TWHDWalletCreate(strength, passphraseString.pointer);
      if (result == nullptr) {
        throw ArgumentError('TWHDWalletCreate(strength, passphraseString.pointer) returned null');
      }

      return HDWallet._(result);
    } finally {
      passphraseString.dispose();
    }
  }

//TODO: research this case
//  if (!TWMnemonicImpl.isValid(mnemonic)) throw Exception(["mnemonic is invalid"]);
//     final _passphraseTWString = TWStringImpl.toTWString(passphrase);
//     final _mnemonicTWString = TWStringImpl.toTWString(mnemonic);
//     final wallet = TWHDWallet.TWHDWalletCreateWithMnemonic(_mnemonicTWString, _passphraseTWString);
//     TWStringImpl.delete(_passphraseTWString);
//     TWStringImpl.delete(_mnemonicTWString);
//     return wallet;
  factory HDWallet.createWithMnemonic(String mnemonic, String passphrase) {
    final mnemonicString = StringImpl.createWithString(mnemonic);
    final passphraseString = StringImpl.createWithString(passphrase);

    try {
      //TODO: implement this
      // final bool isValid = core.TWMnemonicIsValid(mnemonicString.pointer);

      // if (!isValid) {
      //   throw Exception(["mnemonic is invalid"]);
      // }

      final result = _bindings.TWHDWalletCreateWithMnemonic(mnemonicString.pointer, passphraseString.pointer);
      if (result == nullptr) {
        throw ArgumentError(
          'TWHDWalletCreateWithMnemonic(mnemonicString.pointer, passphraseString.pointer) returned null',
        );
      }

      return HDWallet._(result);
    } finally {
      mnemonicString.dispose();
      passphraseString.dispose();
    }
  }

  factory HDWallet.createWithMnemonicCheck(
    String mnemonic,
    String passphrase,
    bool check,
  ) {
    final mnemonicString = StringImpl.createWithString(mnemonic);
    final passphraseString = StringImpl.createWithString(passphrase);
    try {
      final result =
          _bindings.TWHDWalletCreateWithMnemonicCheck(mnemonicString.pointer, passphraseString.pointer, check);
      if (result == nullptr) {
        throw ArgumentError(
          'TWHDWalletCreateWithMnemonicCheck(mnemonicString.pointer, passphraseString.pointer, check) returned null',
        );
      }

      return HDWallet._(result);
    } finally {
      mnemonicString.dispose();
      passphraseString.dispose();
    }
  }

  factory HDWallet.createWithEntropy(Uint8List entropy, String passphrase) {
    final entropyUint8List = DataImpl.createWithBytes(entropy);
    final passphraseString = StringImpl.createWithString(passphrase);
    try {
      final result = _bindings.TWHDWalletCreateWithEntropy(entropyUint8List.pointer, passphraseString.pointer);
      if (result == nullptr) {
        throw ArgumentError(
            'TWHDWalletCreateWithEntropy(entropyUint8List.pointer, passphraseString.pointer) returned null');
      }

      return HDWallet._(result);
    } finally {
      entropyUint8List.dispose();
      passphraseString.dispose();
    }
  }

  @override
  dispose() {
    _bindings.TWHDWalletDelete(pointer);
  }

  PrivateKey getMasterKey(TWCurve curve) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetMasterKey(obj, curve);

    return PrivateKey._(result);
  }

  PrivateKey getKeyForCoin(TWCoinType coin) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetKeyForCoin(obj, coin);

    return PrivateKey._(result);
  }

  String getAddressForCoin(TWCoinType coin) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetAddressForCoin(obj, coin);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getAddressDerivation(TWCoinType coin, TWDerivation derivation) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetAddressDerivation(obj, coin, derivation);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  PrivateKey getKey(TWCoinType coin, String derivationPath) {
    final obj = pointer;
    final derivationPathString = StringImpl.createWithString(derivationPath);
    final result = _bindings.TWHDWalletGetKey(obj, coin, derivationPathString.pointer);
    derivationPathString.dispose();

    return PrivateKey._(result);
  }

  PrivateKey getKeyDerivation(TWCoinType coin, TWDerivation derivation) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetKeyDerivation(obj, coin, derivation);

    return PrivateKey._(result);
  }

  PrivateKey getKeyByCurve(TWCurve curve, String derivationPath) {
    final obj = pointer;
    final derivationPathString = StringImpl.createWithString(derivationPath);
    final result = _bindings.TWHDWalletGetKeyByCurve(obj, curve, derivationPathString.pointer);
    derivationPathString.dispose();

    return PrivateKey._(result);
  }

  PrivateKey getDerivedKey(TWCoinType coin, int account, int change, int address) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetDerivedKey(obj, coin, account, change, address);

    return PrivateKey._(result);
  }

  String getExtendedPrivateKey(TWPurpose purpose, TWCoinType coin, TWHDVersion version) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetExtendedPrivateKey(obj, purpose, coin, version);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getExtendedPublicKey(TWPurpose purpose, TWCoinType coin, TWHDVersion version) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetExtendedPublicKey(obj, purpose, coin, version);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getExtendedPrivateKeyAccount(
      TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version, int account) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetExtendedPrivateKeyAccount(obj, purpose, coin, derivation, version, account);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getExtendedPublicKeyAccount(
      TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version, int account) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetExtendedPublicKeyAccount(obj, purpose, coin, derivation, version, account);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getExtendedPrivateKeyDerivation(
      TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetExtendedPrivateKeyDerivation(obj, purpose, coin, derivation, version);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getExtendedPublicKeyDerivation(
      TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version) {
    final obj = pointer;
    final result = _bindings.TWHDWalletGetExtendedPublicKeyDerivation(obj, purpose, coin, derivation, version);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static PublicKey? getPublicKeyFromExtended(String extended, TWCoinType coin, String derivationPath) {
    final extendedString = StringImpl.createWithString(extended);
    final derivationPathString = StringImpl.createWithString(derivationPath);
    try {
      final result =
          _bindings.TWHDWalletGetPublicKeyFromExtended(extendedString.pointer, coin, derivationPathString.pointer);
      if (result == nullptr) {
        return null;
      }

      return PublicKey._(result);
    } finally {
      extendedString.dispose();
      derivationPathString.dispose();
    }
  }

  Uint8List get seed {
    final obj = pointer;
    final result = _bindings.TWHDWalletSeed(obj);
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  String get mnemonic {
    final obj = pointer;
    final result = _bindings.TWHDWalletMnemonic(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  Uint8List get entropy {
    final obj = pointer;
    final result = _bindings.TWHDWalletEntropy(obj);
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
}
