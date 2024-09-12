// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class BitcoinScript implements Disposable {
    final Pointer<TWBitcoinScript> _pointer;

    Pointer<TWBitcoinScript> get pointer => _pointer;

    const BitcoinScript._(Pointer<TWBitcoinScript> pointer) : _pointer = pointer;

    @override
    bool operator == (Object other) => switch(other) {
        BitcoinScript obj => _bindings.TWBitcoinScriptEqual(_pointer, obj.pointer),
        _ => false,
    };

    @override
    int get hashCode => _pointer.hashCode;

    factory BitcoinScript.create() {
        final result = _bindings.TWBitcoinScriptCreate();

        return BitcoinScript._(result);
    }

    factory BitcoinScript.createWithData(Uint8List data) {
        final dataUint8List = DataImpl.createWithBytes(data);
        final result = _bindings.TWBitcoinScriptCreateWithData(dataUint8List.pointer);
        dataUint8List.dispose();

        return BitcoinScript._(result);
    }

    factory BitcoinScript.createCopy(BitcoinScript script) {
        final scriptBitcoinScript = script.pointer;
        final result = _bindings.TWBitcoinScriptCreateCopy(scriptBitcoinScript);

        return BitcoinScript._(result);
    }

    @override
    dispose() {
        _bindings.TWBitcoinScriptDelete(pointer);
    }

    Uint8List? matchPayToPubkey() {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptMatchPayToPubkey(obj);
        if (result == nullptr) {
            return null;
        }
        final wrapper = DataImpl.createWithData(result);
        final val = wrapper.bytes;
        wrapper.dispose();

        return val;
    }

    Uint8List? matchPayToPubkeyHash() {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptMatchPayToPubkeyHash(obj);
        if (result == nullptr) {
            return null;
        }
        final wrapper = DataImpl.createWithData(result);
        final val = wrapper.bytes;
        wrapper.dispose();

        return val;
    }

    Uint8List? matchPayToScriptHash() {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptMatchPayToScriptHash(obj);
        if (result == nullptr) {
            return null;
        }
        final wrapper = DataImpl.createWithData(result);
        final val = wrapper.bytes;
        wrapper.dispose();

        return val;
    }

    Uint8List? matchPayToWitnessPublicKeyHash() {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptMatchPayToWitnessPublicKeyHash(obj);
        if (result == nullptr) {
            return null;
        }
        final wrapper = DataImpl.createWithData(result);
        final val = wrapper.bytes;
        wrapper.dispose();

        return val;
    }

    Uint8List? matchPayToWitnessScriptHash() {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptMatchPayToWitnessScriptHash(obj);
        if (result == nullptr) {
            return null;
        }
        final wrapper = DataImpl.createWithData(result);
        final val = wrapper.bytes;
        wrapper.dispose();

        return val;
    }

    Uint8List encode() {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptEncode(obj);
        final wrapper = DataImpl.createWithData(result);
        final val = wrapper.bytes;
        wrapper.dispose();

        return val;
    }

    static BitcoinScript buildPayToPublicKey(Uint8List pubkey) {
        final pubkeyUint8List = DataImpl.createWithBytes(pubkey);
        final result = _bindings.TWBitcoinScriptBuildPayToPublicKey(pubkeyUint8List.pointer);
        pubkeyUint8List.dispose();

        return BitcoinScript._(result);
    }

    static BitcoinScript buildPayToPublicKeyHash(Uint8List hash) {
        final hashUint8List = DataImpl.createWithBytes(hash);
        final result = _bindings.TWBitcoinScriptBuildPayToPublicKeyHash(hashUint8List.pointer);
        hashUint8List.dispose();

        return BitcoinScript._(result);
    }

    static BitcoinScript buildPayToScriptHash(Uint8List scriptHash) {
        final scriptHashUint8List = DataImpl.createWithBytes(scriptHash);
        final result = _bindings.TWBitcoinScriptBuildPayToScriptHash(scriptHashUint8List.pointer);
        scriptHashUint8List.dispose();

        return BitcoinScript._(result);
    }

    static BitcoinScript buildPayToWitnessPubkeyHash(Uint8List hash) {
        final hashUint8List = DataImpl.createWithBytes(hash);
        final result = _bindings.TWBitcoinScriptBuildPayToWitnessPubkeyHash(hashUint8List.pointer);
        hashUint8List.dispose();

        return BitcoinScript._(result);
    }

    static BitcoinScript buildPayToWitnessScriptHash(Uint8List scriptHash) {
        final scriptHashUint8List = DataImpl.createWithBytes(scriptHash);
        final result = _bindings.TWBitcoinScriptBuildPayToWitnessScriptHash(scriptHashUint8List.pointer);
        scriptHashUint8List.dispose();

        return BitcoinScript._(result);
    }

    static BitcoinScript lockScriptForAddress(String address, CoinType coin) {
        final addressString = StringImpl.createWithString(address);
        final coinEnum = TWCoinType.fromValue(coin.value);
        final result = _bindings.TWBitcoinScriptLockScriptForAddress(addressString.pointer, coinEnum);
        addressString.dispose();

        return BitcoinScript._(result);
    }

    static int hashTypeForCoin(CoinType coinType) {
        final coinTypeEnum = TWCoinType.fromValue(coinType.value);
        final result = _bindings.TWBitcoinScriptHashTypeForCoin(coinTypeEnum);

        return result;
    }

    
    int get size {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptSize(obj);

        return result;
    }

    
    Uint8List get data {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptData(obj);
        final wrapper = DataImpl.createWithData(result);
        final val = wrapper.bytes;
        wrapper.dispose();

        return val;
    }

    
    Uint8List get scriptHash {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptScriptHash(obj);
        final wrapper = DataImpl.createWithData(result);
        final val = wrapper.bytes;
        wrapper.dispose();

        return val;
    }

    
    bool get isPayToScriptHash {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptIsPayToScriptHash(obj);

        return result;
    }

    
    bool get isPayToWitnessScriptHash {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptIsPayToWitnessScriptHash(obj);

        return result;
    }

    
    bool get isPayToWitnessPublicKeyHash {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptIsPayToWitnessPublicKeyHash(obj);

        return result;
    }

    
    bool get isWitnessProgram {
        final obj = pointer;
        final result = _bindings.TWBitcoinScriptIsWitnessProgram(obj);

        return result;
    }
}
