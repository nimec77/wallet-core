// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class Account implements Disposable {
    final Pointer<TWAccount> _pointer;

    Pointer<TWAccount> get pointer => _pointer;

    const Account._(Pointer<TWAccount> pointer) : _pointer = pointer;

    factory Account.create(String address, CoinType coin, Derivation derivation, String derivationPath, String publicKey, String extendedPublicKey) {
        final addressString = StringImpl.createWithString(address);
        final coinEnum = TWCoinType.fromValue(coin.value);
        final derivationEnum = TWDerivation.fromValue(derivation.value);
        final derivationPathString = StringImpl.createWithString(derivationPath);
        final publicKeyString = StringImpl.createWithString(publicKey);
        final extendedPublicKeyString = StringImpl.createWithString(extendedPublicKey);
        final result = _bindings.TWAccountCreate(addressString.pointer, coinEnum, derivationEnum, derivationPathString.pointer, publicKeyString.pointer, extendedPublicKeyString.pointer);
        addressString.dispose();
        derivationPathString.dispose();
        publicKeyString.dispose();
        extendedPublicKeyString.dispose();

        return Account._(result);
    }

    @override
    dispose() {
        _bindings.TWAccountDelete(pointer);
    }

    
    String get address {
        final obj = pointer;
        final result = _bindings.TWAccountAddress(obj);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    
    CoinType get coin {
        final obj = pointer;
        final result = _bindings.TWAccountCoin(obj);

        return CoinType.fromValue(result.value);
    }

    
    Derivation get derivation {
        final obj = pointer;
        final result = _bindings.TWAccountDerivation(obj);

        return Derivation.fromValue(result.value);
    }

    
    String get derivationPath {
        final obj = pointer;
        final result = _bindings.TWAccountDerivationPath(obj);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    
    String get publicKey {
        final obj = pointer;
        final result = _bindings.TWAccountPublicKey(obj);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    
    String get extendedPublicKey {
        final obj = pointer;
        final result = _bindings.TWAccountExtendedPublicKey(obj);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }
}
