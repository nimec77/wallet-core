// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class RippleXAddress implements Disposable, Address {
    final Pointer<TWRippleXAddress> _pointer;

    Pointer<TWRippleXAddress> get pointer => _pointer;

    const RippleXAddress._(Pointer<TWRippleXAddress> pointer) : _pointer = pointer;

    @override
    bool operator == (Object other) => switch(other) {
        RippleXAddress obj => _bindings.TWRippleXAddressEqual(_pointer, obj.pointer),
        _ => false,
    };

    @override
    int get hashCode => _pointer.hashCode;

    factory RippleXAddress.createWithString(String string) {
        final stringString = StringImpl.createWithString(string);
        try {
            final result = _bindings.TWRippleXAddressCreateWithString(stringString.pointer);
            if (result == nullptr) {
                throw ArgumentError('RippleXAddress.createWithString: string=$string');
            }

            return RippleXAddress._(result);
        } finally {
            stringString.dispose();
        }
    }

    factory RippleXAddress.createWithPublicKey(PublicKey publicKey, int tag) {
        final publicKeyPublicKey = publicKey.pointer;
        final result = _bindings.TWRippleXAddressCreateWithPublicKey(publicKeyPublicKey, tag);

        return RippleXAddress._(result);
    }

    @override
    dispose() {
        _bindings.TWRippleXAddressDelete(pointer);
    }

    static bool isValidString(String string) {
        final stringString = StringImpl.createWithString(string);
        final result = _bindings.TWRippleXAddressIsValidString(stringString.pointer);
        stringString.dispose();

        return result;
    }

    @override
    String get description {
        final obj = pointer;
        final result = _bindings.TWRippleXAddressDescription(obj);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    
    int get tag {
        final obj = pointer;
        final result = _bindings.TWRippleXAddressTag(obj);

        return result;
    }
}
