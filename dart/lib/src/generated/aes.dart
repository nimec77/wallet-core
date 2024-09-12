// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class AES {

    static Uint8List? encryptCBC(Uint8List key, Uint8List data, Uint8List iv, AESPaddingMode mode) {
        final keyUint8List = DataImpl.createWithBytes(key);
        final dataUint8List = DataImpl.createWithBytes(data);
        final ivUint8List = DataImpl.createWithBytes(iv);
        final modeEnum = TWAESPaddingMode.fromValue(mode.value);
        try {
            final result = _bindings.TWAESEncryptCBC(keyUint8List.pointer, dataUint8List.pointer, ivUint8List.pointer, modeEnum);
            if (result == nullptr) {
                return null;
            }
            final wrapper = DataImpl.createWithData(result);
            final val = wrapper.bytes;
            wrapper.dispose();

            return val;
        } finally {
            keyUint8List.dispose();
            dataUint8List.dispose();
            ivUint8List.dispose();
        }
    }

    static Uint8List? decryptCBC(Uint8List key, Uint8List data, Uint8List iv, AESPaddingMode mode) {
        final keyUint8List = DataImpl.createWithBytes(key);
        final dataUint8List = DataImpl.createWithBytes(data);
        final ivUint8List = DataImpl.createWithBytes(iv);
        final modeEnum = TWAESPaddingMode.fromValue(mode.value);
        try {
            final result = _bindings.TWAESDecryptCBC(keyUint8List.pointer, dataUint8List.pointer, ivUint8List.pointer, modeEnum);
            if (result == nullptr) {
                return null;
            }
            final wrapper = DataImpl.createWithData(result);
            final val = wrapper.bytes;
            wrapper.dispose();

            return val;
        } finally {
            keyUint8List.dispose();
            dataUint8List.dispose();
            ivUint8List.dispose();
        }
    }

    static Uint8List? encryptCTR(Uint8List key, Uint8List data, Uint8List iv) {
        final keyUint8List = DataImpl.createWithBytes(key);
        final dataUint8List = DataImpl.createWithBytes(data);
        final ivUint8List = DataImpl.createWithBytes(iv);
        try {
            final result = _bindings.TWAESEncryptCTR(keyUint8List.pointer, dataUint8List.pointer, ivUint8List.pointer);
            if (result == nullptr) {
                return null;
            }
            final wrapper = DataImpl.createWithData(result);
            final val = wrapper.bytes;
            wrapper.dispose();

            return val;
        } finally {
            keyUint8List.dispose();
            dataUint8List.dispose();
            ivUint8List.dispose();
        }
    }

    static Uint8List? decryptCTR(Uint8List key, Uint8List data, Uint8List iv) {
        final keyUint8List = DataImpl.createWithBytes(key);
        final dataUint8List = DataImpl.createWithBytes(data);
        final ivUint8List = DataImpl.createWithBytes(iv);
        try {
            final result = _bindings.TWAESDecryptCTR(keyUint8List.pointer, dataUint8List.pointer, ivUint8List.pointer);
            if (result == nullptr) {
                return null;
            }
            final wrapper = DataImpl.createWithData(result);
            final val = wrapper.bytes;
            wrapper.dispose();

            return val;
        } finally {
            keyUint8List.dispose();
            dataUint8List.dispose();
            ivUint8List.dispose();
        }
    }
}
