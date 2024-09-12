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

    const HDWallet._(Pointer<TWHDWallet> pointer) : _pointer = pointer;

    factory HDWallet.create(int strength, String passphrase) {
        final passphraseString = StringImpl.createWithString(passphrase);
        try {
            final result = _bindings.TWHDWalletCreate(strength, passphraseString.pointer);
            if (result == nullptr) {
                throw ArgumentError('HDWallet.create: strength=$strength, passphrase=$passphrase');
            }

            return HDWallet._(result);
        } finally {
            passphraseString.dispose();
        }
    }

    factory HDWallet.createWithMnemonic(String mnemonic, String passphrase) {
        final mnemonicString = StringImpl.createWithString(mnemonic);
        final passphraseString = StringImpl.createWithString(passphrase);
        try {
            final result = _bindings.TWHDWalletCreateWithMnemonic(mnemonicString.pointer, passphraseString.pointer);
            if (result == nullptr) {
                throw ArgumentError('HDWallet.createWithMnemonic: mnemonic=$mnemonic, passphrase=$passphrase');
            }

            return HDWallet._(result);
        } finally {
            mnemonicString.dispose();
            passphraseString.dispose();
        }
    }

    factory HDWallet.createWithMnemonicCheck(String mnemonic, String passphrase, bool check) {
        final mnemonicString = StringImpl.createWithString(mnemonic);
        final passphraseString = StringImpl.createWithString(passphrase);
        try {
            final result = _bindings.TWHDWalletCreateWithMnemonicCheck(mnemonicString.pointer, passphraseString.pointer, check);
            if (result == nullptr) {
                throw ArgumentError('HDWallet.createWithMnemonicCheck: mnemonic=$mnemonic, passphrase=$passphrase, check=$check');
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
                throw ArgumentError('HDWallet.createWithEntropy: entropy=$entropy, passphrase=$passphrase');
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

    PrivateKey getMasterKey(Curve curve) {
        final obj = pointer;
        final curveEnum = TWCurve.fromValue(curve.value);
        final result = _bindings.TWHDWalletGetMasterKey(obj, curveEnum);

        return PrivateKey._(result);
    }

    PrivateKey getKeyForCoin(CoinType coin) {
        final obj = pointer;
        final coinEnum = TWCoinType.fromValue(coin.value);
        final result = _bindings.TWHDWalletGetKeyForCoin(obj, coinEnum);

        return PrivateKey._(result);
    }

    String getAddressForCoin(CoinType coin) {
        final obj = pointer;
        final coinEnum = TWCoinType.fromValue(coin.value);
        final result = _bindings.TWHDWalletGetAddressForCoin(obj, coinEnum);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    String getAddressDerivation(CoinType coin, Derivation derivation) {
        final obj = pointer;
        final coinEnum = TWCoinType.fromValue(coin.value);
        final derivationEnum = TWDerivation.fromValue(derivation.value);
        final result = _bindings.TWHDWalletGetAddressDerivation(obj, coinEnum, derivationEnum);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    PrivateKey getKey(CoinType coin, String derivationPath) {
        final obj = pointer;
        final coinEnum = TWCoinType.fromValue(coin.value);
        final derivationPathString = StringImpl.createWithString(derivationPath);
        final result = _bindings.TWHDWalletGetKey(obj, coinEnum, derivationPathString.pointer);
        derivationPathString.dispose();

        return PrivateKey._(result);
    }

    PrivateKey getKeyDerivation(CoinType coin, Derivation derivation) {
        final obj = pointer;
        final coinEnum = TWCoinType.fromValue(coin.value);
        final derivationEnum = TWDerivation.fromValue(derivation.value);
        final result = _bindings.TWHDWalletGetKeyDerivation(obj, coinEnum, derivationEnum);

        return PrivateKey._(result);
    }

    PrivateKey getKeyByCurve(Curve curve, String derivationPath) {
        final obj = pointer;
        final curveEnum = TWCurve.fromValue(curve.value);
        final derivationPathString = StringImpl.createWithString(derivationPath);
        final result = _bindings.TWHDWalletGetKeyByCurve(obj, curveEnum, derivationPathString.pointer);
        derivationPathString.dispose();

        return PrivateKey._(result);
    }

    PrivateKey getDerivedKey(CoinType coin, int account, int change, int address) {
        final obj = pointer;
        final coinEnum = TWCoinType.fromValue(coin.value);
        final result = _bindings.TWHDWalletGetDerivedKey(obj, coinEnum, account, change, address);

        return PrivateKey._(result);
    }

    String getExtendedPrivateKey(Purpose purpose, CoinType coin, HDVersion version) {
        final obj = pointer;
        final purposeEnum = TWPurpose.fromValue(purpose.value);
        final coinEnum = TWCoinType.fromValue(coin.value);
        final versionEnum = TWHDVersion.fromValue(version.value);
        final result = _bindings.TWHDWalletGetExtendedPrivateKey(obj, purposeEnum, coinEnum, versionEnum);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    String getExtendedPublicKey(Purpose purpose, CoinType coin, HDVersion version) {
        final obj = pointer;
        final purposeEnum = TWPurpose.fromValue(purpose.value);
        final coinEnum = TWCoinType.fromValue(coin.value);
        final versionEnum = TWHDVersion.fromValue(version.value);
        final result = _bindings.TWHDWalletGetExtendedPublicKey(obj, purposeEnum, coinEnum, versionEnum);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    String getExtendedPrivateKeyAccount(Purpose purpose, CoinType coin, Derivation derivation, HDVersion version, int account) {
        final obj = pointer;
        final purposeEnum = TWPurpose.fromValue(purpose.value);
        final coinEnum = TWCoinType.fromValue(coin.value);
        final derivationEnum = TWDerivation.fromValue(derivation.value);
        final versionEnum = TWHDVersion.fromValue(version.value);
        final result = _bindings.TWHDWalletGetExtendedPrivateKeyAccount(obj, purposeEnum, coinEnum, derivationEnum, versionEnum, account);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    String getExtendedPublicKeyAccount(Purpose purpose, CoinType coin, Derivation derivation, HDVersion version, int account) {
        final obj = pointer;
        final purposeEnum = TWPurpose.fromValue(purpose.value);
        final coinEnum = TWCoinType.fromValue(coin.value);
        final derivationEnum = TWDerivation.fromValue(derivation.value);
        final versionEnum = TWHDVersion.fromValue(version.value);
        final result = _bindings.TWHDWalletGetExtendedPublicKeyAccount(obj, purposeEnum, coinEnum, derivationEnum, versionEnum, account);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    String getExtendedPrivateKeyDerivation(Purpose purpose, CoinType coin, Derivation derivation, HDVersion version) {
        final obj = pointer;
        final purposeEnum = TWPurpose.fromValue(purpose.value);
        final coinEnum = TWCoinType.fromValue(coin.value);
        final derivationEnum = TWDerivation.fromValue(derivation.value);
        final versionEnum = TWHDVersion.fromValue(version.value);
        final result = _bindings.TWHDWalletGetExtendedPrivateKeyDerivation(obj, purposeEnum, coinEnum, derivationEnum, versionEnum);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    String getExtendedPublicKeyDerivation(Purpose purpose, CoinType coin, Derivation derivation, HDVersion version) {
        final obj = pointer;
        final purposeEnum = TWPurpose.fromValue(purpose.value);
        final coinEnum = TWCoinType.fromValue(coin.value);
        final derivationEnum = TWDerivation.fromValue(derivation.value);
        final versionEnum = TWHDVersion.fromValue(version.value);
        final result = _bindings.TWHDWalletGetExtendedPublicKeyDerivation(obj, purposeEnum, coinEnum, derivationEnum, versionEnum);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    static PublicKey? getPublicKeyFromExtended(String extended, CoinType coin, String derivationPath) {
        final extendedString = StringImpl.createWithString(extended);
        final coinEnum = TWCoinType.fromValue(coin.value);
        final derivationPathString = StringImpl.createWithString(derivationPath);
        try {
            final result = _bindings.TWHDWalletGetPublicKeyFromExtended(extendedString.pointer, coinEnum, derivationPathString.pointer);
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
