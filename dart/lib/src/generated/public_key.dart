// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class PublicKey implements Disposable {
    final Pointer<TWPublicKey> _pointer;

    Pointer<TWPublicKey> get pointer => _pointer;

    const PublicKey._(Pointer<TWPublicKey> pointer) : _pointer = pointer;

    factory PublicKey.createWithData(Uint8List data, PublicKeyType type) {
        final dataUint8List = DataImpl.createWithBytes(data);
        final typeEnum = TWPublicKeyType.fromValue(type.value);
        try {
            final result = _bindings.TWPublicKeyCreateWithData(dataUint8List.pointer, typeEnum);
            if (result == nullptr) {
                throw ArgumentError('PublicKey.createWithData: data=$data, type=$type');
            }

            return PublicKey._(result);
        } finally {
            dataUint8List.dispose();
        }
    }

    @override
    dispose() {
        _bindings.TWPublicKeyDelete(pointer);
    }

    static bool isValid(Uint8List data, PublicKeyType type) {
        final dataUint8List = DataImpl.createWithBytes(data);
        final typeEnum = TWPublicKeyType.fromValue(type.value);
        final result = _bindings.TWPublicKeyIsValid(dataUint8List.pointer, typeEnum);
        dataUint8List.dispose();

        return result;
    }

    bool verify(Uint8List signature, Uint8List message) {
        final obj = pointer;
        final signatureUint8List = DataImpl.createWithBytes(signature);
        final messageUint8List = DataImpl.createWithBytes(message);
        final result = _bindings.TWPublicKeyVerify(obj, signatureUint8List.pointer, messageUint8List.pointer);
        signatureUint8List.dispose();
        messageUint8List.dispose();

        return result;
    }

    bool verifyAsDER(Uint8List signature, Uint8List message) {
        final obj = pointer;
        final signatureUint8List = DataImpl.createWithBytes(signature);
        final messageUint8List = DataImpl.createWithBytes(message);
        final result = _bindings.TWPublicKeyVerifyAsDER(obj, signatureUint8List.pointer, messageUint8List.pointer);
        signatureUint8List.dispose();
        messageUint8List.dispose();

        return result;
    }

    bool verifyZilliqaSchnorr(Uint8List signature, Uint8List message) {
        final obj = pointer;
        final signatureUint8List = DataImpl.createWithBytes(signature);
        final messageUint8List = DataImpl.createWithBytes(message);
        final result = _bindings.TWPublicKeyVerifyZilliqaSchnorr(obj, signatureUint8List.pointer, messageUint8List.pointer);
        signatureUint8List.dispose();
        messageUint8List.dispose();

        return result;
    }

    static PublicKey? recover(Uint8List signature, Uint8List message) {
        final signatureUint8List = DataImpl.createWithBytes(signature);
        final messageUint8List = DataImpl.createWithBytes(message);
        try {
            final result = _bindings.TWPublicKeyRecover(signatureUint8List.pointer, messageUint8List.pointer);
            if (result == nullptr) {
                return null;
            }

            return PublicKey._(result);
        } finally {
            signatureUint8List.dispose();
            messageUint8List.dispose();
        }
    }

    
    bool get isCompressed {
        final obj = pointer;
        final result = _bindings.TWPublicKeyIsCompressed(obj);

        return result;
    }

    
    PublicKey get compressed {
        final obj = pointer;
        final result = _bindings.TWPublicKeyCompressed(obj);

        return PublicKey._(result);
    }

    
    PublicKey get uncompressed {
        final obj = pointer;
        final result = _bindings.TWPublicKeyUncompressed(obj);

        return PublicKey._(result);
    }

    
    Uint8List get data {
        final obj = pointer;
        final result = _bindings.TWPublicKeyData(obj);
        final wrapper = DataImpl.createWithData(result);
        final val = wrapper.bytes;
        wrapper.dispose();

        return val;
    }

    
    PublicKeyType get keyType {
        final obj = pointer;
        final result = _bindings.TWPublicKeyKeyType(obj);

        return PublicKeyType.fromValue(result.value);
    }

    
    String get description {
        final obj = pointer;
        final result = _bindings.TWPublicKeyDescription(obj);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }
}
