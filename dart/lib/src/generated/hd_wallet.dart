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
import 'package:trust_wallet_core/src/generated/private_key.dart';
import 'package:trust_wallet_core/src/generated/public_key.dart';

class HDWallet implements Disposable {
  final TrustWalletCoreBindings _core;
  final Pointer<TWHDWallet> _pointer;

  Pointer<TWHDWallet> get pointer => _pointer;

  const HDWallet._(
    TrustWalletCoreBindings core,
    Pointer<TWHDWallet> pointer,
  )   : _core = core,
        _pointer = pointer;

//   HDWallet({int strength = 128, String passphrase = ""}) {
// assert(strength >= 128 && strength <= 256 && strength % 32 == 0);
  factory HDWallet.create(TrustWalletCoreBindings core, int strength, String passphrase) {
    final passphraseString = StringImpl.createWithString(core, passphrase);
    try {
      final result = core.TWHDWalletCreate(strength, passphraseString.pointer);
      if (result == nullptr) {
        throw ArgumentError('TWHDWalletCreate(strength, passphraseString.pointer) returned null');
      }

      return HDWallet._(core, result);
    } finally {
      passphraseString.dispose();
    }
  }

//  if (!TWMnemonicImpl.isValid(mnemonic)) throw Exception(["mnemonic is invalid"]);
//     final _passphraseTWString = TWStringImpl.toTWString(passphrase);
//     final _mnemonicTWString = TWStringImpl.toTWString(mnemonic);
//     final wallet = TWHDWallet.TWHDWalletCreateWithMnemonic(_mnemonicTWString, _passphraseTWString);
//     TWStringImpl.delete(_passphraseTWString);
//     TWStringImpl.delete(_mnemonicTWString);
//     return wallet;
  factory HDWallet.createWithMnemonic(TrustWalletCoreBindings core, String mnemonic, String passphrase) {
    final mnemonicString = StringImpl.createWithString(core, mnemonic);
    final passphraseString = StringImpl.createWithString(core, passphrase);

    try {
      //TODO: implement this
      // final bool isValid = core.TWMnemonicIsValid(mnemonicString.pointer);

      // if (!isValid) {
      //   throw Exception(["mnemonic is invalid"]);
      // }

      final result = core.TWHDWalletCreateWithMnemonic(mnemonicString.pointer, passphraseString.pointer);
      if (result == nullptr) {
        throw ArgumentError(
          'TWHDWalletCreateWithMnemonic(mnemonicString.pointer, passphraseString.pointer) returned null',
        );
      }

      return HDWallet._(core, result);
    } finally {
      mnemonicString.dispose();
      passphraseString.dispose();
    }
  }

  factory HDWallet.createWithMnemonicCheck(
    TrustWalletCoreBindings core,
    String mnemonic,
    String passphrase,
    bool check,
  ) {
    final mnemonicString = StringImpl.createWithString(core, mnemonic);
    final passphraseString = StringImpl.createWithString(core, passphrase);
    try {
      final result = core.TWHDWalletCreateWithMnemonicCheck(mnemonicString.pointer, passphraseString.pointer, check);
      if (result == nullptr) {
        throw ArgumentError(
            'TWHDWalletCreateWithMnemonicCheck(mnemonicString.pointer, passphraseString.pointer, check) returned null');
      }

      return HDWallet._(core, result);
    } finally {
      mnemonicString.dispose();
      passphraseString.dispose();
    }
  }

  factory HDWallet.createWithEntropy(TrustWalletCoreBindings core, Uint8List entropy, String passphrase) {
    final entropyUint8List = DataImpl.createWithBytes(core, entropy);
    final passphraseString = StringImpl.createWithString(core, passphrase);
    try {
      final result = core.TWHDWalletCreateWithEntropy(entropyUint8List.pointer, passphraseString.pointer);
      if (result == nullptr) {
        throw ArgumentError(
            'TWHDWalletCreateWithEntropy(entropyUint8List.pointer, passphraseString.pointer) returned null');
      }

      return HDWallet._(core, result);
    } finally {
      entropyUint8List.dispose();
      passphraseString.dispose();
    }
  }

  @override
  dispose() {
    _core.TWHDWalletDelete(pointer);
  }

  PrivateKey getMasterKey(TWCurve curve) {
    final obj = pointer;
    final result = _core.TWHDWalletGetMasterKey(obj, curve);

    return PrivateKey(_core, result);
  }

  PrivateKey getKeyForCoin(TWCoinType coin) {
    final obj = pointer;
    final result = _core.TWHDWalletGetKeyForCoin(obj, coin);

    return PrivateKey(_core, result);
  }

  String getAddressForCoin(TWCoinType coin) {
    final obj = pointer;
    final result = _core.TWHDWalletGetAddressForCoin(obj, coin);
    final wrapper = StringImpl.createWithPointer(_core, result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getAddressDerivation(TWCoinType coin, TWDerivation derivation) {
    final obj = pointer;
    final result = _core.TWHDWalletGetAddressDerivation(obj, coin, derivation);
    final wrapper = StringImpl.createWithPointer(_core, result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  PrivateKey getKey(TWCoinType coin, String derivationPath) {
    final obj = pointer;
    final derivationPathString = StringImpl.createWithString(_core, derivationPath);
    final result = _core.TWHDWalletGetKey(obj, coin, derivationPathString.pointer);
    derivationPathString.dispose();

    return PrivateKey(_core, result);
  }

  PrivateKey getKeyDerivation(TWCoinType coin, TWDerivation derivation) {
    final obj = pointer;
    final result = _core.TWHDWalletGetKeyDerivation(obj, coin, derivation);

    return PrivateKey(_core, result);
  }

  PrivateKey getKeyByCurve(TWCurve curve, String derivationPath) {
    final obj = pointer;
    final derivationPathString = StringImpl.createWithString(_core, derivationPath);
    final result = _core.TWHDWalletGetKeyByCurve(obj, curve, derivationPathString.pointer);
    derivationPathString.dispose();

    return PrivateKey(_core, result);
  }

  PrivateKey getDerivedKey(TWCoinType coin, int account, int change, int address) {
    final obj = pointer;
    final result = _core.TWHDWalletGetDerivedKey(obj, coin, account, change, address);

    return PrivateKey(_core, result);
  }

  String getExtendedPrivateKey(TWPurpose purpose, TWCoinType coin, TWHDVersion version) {
    final obj = pointer;
    final result = _core.TWHDWalletGetExtendedPrivateKey(obj, purpose, coin, version);
    final wrapper = StringImpl.createWithPointer(_core, result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getExtendedPublicKey(TWPurpose purpose, TWCoinType coin, TWHDVersion version) {
    final obj = pointer;
    final result = _core.TWHDWalletGetExtendedPublicKey(obj, purpose, coin, version);
    final wrapper = StringImpl.createWithPointer(_core, result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getExtendedPrivateKeyAccount(
      TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version, int account) {
    final obj = pointer;
    final result = _core.TWHDWalletGetExtendedPrivateKeyAccount(obj, purpose, coin, derivation, version, account);
    final wrapper = StringImpl.createWithPointer(_core, result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getExtendedPublicKeyAccount(
      TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version, int account) {
    final obj = pointer;
    final result = _core.TWHDWalletGetExtendedPublicKeyAccount(obj, purpose, coin, derivation, version, account);
    final wrapper = StringImpl.createWithPointer(_core, result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getExtendedPrivateKeyDerivation(
      TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version) {
    final obj = pointer;
    final result = _core.TWHDWalletGetExtendedPrivateKeyDerivation(obj, purpose, coin, derivation, version);
    final wrapper = StringImpl.createWithPointer(_core, result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  String getExtendedPublicKeyDerivation(
      TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version) {
    final obj = pointer;
    final result = _core.TWHDWalletGetExtendedPublicKeyDerivation(obj, purpose, coin, derivation, version);
    final wrapper = StringImpl.createWithPointer(_core, result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static PublicKey? getPublicKeyFromExtended(
      TrustWalletCoreBindings core, String extended, TWCoinType coin, String derivationPath) {
    final extendedString = StringImpl.createWithString(core, extended);
    final derivationPathString = StringImpl.createWithString(core, derivationPath);
    try {
      final result =
          core.TWHDWalletGetPublicKeyFromExtended(extendedString.pointer, coin, derivationPathString.pointer);
      if (result == nullptr) {
        return null;
      }

      return PublicKey(core, result);
    } finally {
      extendedString.dispose();
      derivationPathString.dispose();
    }
  }

  Uint8List get seed {
    final obj = pointer;
    final result = _core.TWHDWalletSeed(obj);
    final wrapper = DataImpl.createWithData(_core, result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  String get mnemonic {
    final obj = pointer;
    final result = _core.TWHDWalletMnemonic(obj);
    final wrapper = StringImpl.createWithPointer(_core, result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  Uint8List get entropy {
    final obj = pointer;
    final result = _core.TWHDWalletEntropy(obj);
    final wrapper = DataImpl.createWithData(_core, result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
}
