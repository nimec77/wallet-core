// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class EthereumAbiFunction implements Disposable {
    final Pointer<TWEthereumAbiFunction> _pointer;

    Pointer<TWEthereumAbiFunction> get pointer => _pointer;

    const EthereumAbiFunction._(Pointer<TWEthereumAbiFunction> pointer) : _pointer = pointer;

    factory EthereumAbiFunction.createWithString(String name) {
        final nameString = StringImpl.createWithString(name);
        final result = _bindings.TWEthereumAbiFunctionCreateWithString(nameString.pointer);
        nameString.dispose();

        return EthereumAbiFunction._(result);
    }

    @override
    dispose() {
        _bindings.TWEthereumAbiFunctionDelete(pointer);
    }

    String getType() {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionGetType(obj);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    int addParamUInt8(int val, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddParamUInt8(obj, val, isOutput);

        return result;
    }

    int addParamUInt16(int val, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddParamUInt16(obj, val, isOutput);

        return result;
    }

    int addParamUInt32(int val, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddParamUInt32(obj, val, isOutput);

        return result;
    }

    int addParamUInt64(int val, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddParamUInt64(obj, val, isOutput);

        return result;
    }

    int addParamUInt256(Uint8List val, bool isOutput) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddParamUInt256(obj, valUint8List.pointer, isOutput);
        valUint8List.dispose();

        return result;
    }

    int addParamUIntN(int bits, Uint8List val, bool isOutput) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddParamUIntN(obj, bits, valUint8List.pointer, isOutput);
        valUint8List.dispose();

        return result;
    }

    int addParamInt8(int val, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddParamInt8(obj, val, isOutput);

        return result;
    }

    int addParamInt16(int val, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddParamInt16(obj, val, isOutput);

        return result;
    }

    int addParamInt32(int val, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddParamInt32(obj, val, isOutput);

        return result;
    }

    int addParamInt64(int val, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddParamInt64(obj, val, isOutput);

        return result;
    }

    int addParamInt256(Uint8List val, bool isOutput) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddParamInt256(obj, valUint8List.pointer, isOutput);
        valUint8List.dispose();

        return result;
    }

    int addParamIntN(int bits, Uint8List val, bool isOutput) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddParamIntN(obj, bits, valUint8List.pointer, isOutput);
        valUint8List.dispose();

        return result;
    }

    int addParamBool(bool val, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddParamBool(obj, val, isOutput);

        return result;
    }

    int addParamString(String val, bool isOutput) {
        final obj = pointer;
        final valString = StringImpl.createWithString(val);
        final result = _bindings.TWEthereumAbiFunctionAddParamString(obj, valString.pointer, isOutput);
        valString.dispose();

        return result;
    }

    int addParamAddress(Uint8List val, bool isOutput) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddParamAddress(obj, valUint8List.pointer, isOutput);
        valUint8List.dispose();

        return result;
    }

    int addParamBytes(Uint8List val, bool isOutput) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddParamBytes(obj, valUint8List.pointer, isOutput);
        valUint8List.dispose();

        return result;
    }

    int addParamBytesFix(int size, Uint8List val, bool isOutput) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddParamBytesFix(obj, size, valUint8List.pointer, isOutput);
        valUint8List.dispose();

        return result;
    }

    int addParamArray(bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddParamArray(obj, isOutput);

        return result;
    }

    int getParamUInt8(int idx, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionGetParamUInt8(obj, idx, isOutput);

        return result;
    }

    int getParamUInt64(int idx, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionGetParamUInt64(obj, idx, isOutput);

        return result;
    }

    Uint8List getParamUInt256(int idx, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionGetParamUInt256(obj, idx, isOutput);
        final wrapper = DataImpl.createWithData(result);
        final val = wrapper.bytes;
        wrapper.dispose();

        return val;
    }

    bool getParamBool(int idx, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionGetParamBool(obj, idx, isOutput);

        return result;
    }

    String getParamString(int idx, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionGetParamString(obj, idx, isOutput);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    Uint8List getParamAddress(int idx, bool isOutput) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionGetParamAddress(obj, idx, isOutput);
        final wrapper = DataImpl.createWithData(result);
        final val = wrapper.bytes;
        wrapper.dispose();

        return val;
    }

    int addInArrayParamUInt8(int arrayIdx, int val) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamUInt8(obj, arrayIdx, val);

        return result;
    }

    int addInArrayParamUInt16(int arrayIdx, int val) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamUInt16(obj, arrayIdx, val);

        return result;
    }

    int addInArrayParamUInt32(int arrayIdx, int val) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamUInt32(obj, arrayIdx, val);

        return result;
    }

    int addInArrayParamUInt64(int arrayIdx, int val) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamUInt64(obj, arrayIdx, val);

        return result;
    }

    int addInArrayParamUInt256(int arrayIdx, Uint8List val) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamUInt256(obj, arrayIdx, valUint8List.pointer);
        valUint8List.dispose();

        return result;
    }

    int addInArrayParamUIntN(int arrayIdx, int bits, Uint8List val) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamUIntN(obj, arrayIdx, bits, valUint8List.pointer);
        valUint8List.dispose();

        return result;
    }

    int addInArrayParamInt8(int arrayIdx, int val) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamInt8(obj, arrayIdx, val);

        return result;
    }

    int addInArrayParamInt16(int arrayIdx, int val) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamInt16(obj, arrayIdx, val);

        return result;
    }

    int addInArrayParamInt32(int arrayIdx, int val) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamInt32(obj, arrayIdx, val);

        return result;
    }

    int addInArrayParamInt64(int arrayIdx, int val) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamInt64(obj, arrayIdx, val);

        return result;
    }

    int addInArrayParamInt256(int arrayIdx, Uint8List val) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamInt256(obj, arrayIdx, valUint8List.pointer);
        valUint8List.dispose();

        return result;
    }

    int addInArrayParamIntN(int arrayIdx, int bits, Uint8List val) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamIntN(obj, arrayIdx, bits, valUint8List.pointer);
        valUint8List.dispose();

        return result;
    }

    int addInArrayParamBool(int arrayIdx, bool val) {
        final obj = pointer;
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamBool(obj, arrayIdx, val);

        return result;
    }

    int addInArrayParamString(int arrayIdx, String val) {
        final obj = pointer;
        final valString = StringImpl.createWithString(val);
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamString(obj, arrayIdx, valString.pointer);
        valString.dispose();

        return result;
    }

    int addInArrayParamAddress(int arrayIdx, Uint8List val) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamAddress(obj, arrayIdx, valUint8List.pointer);
        valUint8List.dispose();

        return result;
    }

    int addInArrayParamBytes(int arrayIdx, Uint8List val) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamBytes(obj, arrayIdx, valUint8List.pointer);
        valUint8List.dispose();

        return result;
    }

    int addInArrayParamBytesFix(int arrayIdx, int size, Uint8List val) {
        final obj = pointer;
        final valUint8List = DataImpl.createWithBytes(val);
        final result = _bindings.TWEthereumAbiFunctionAddInArrayParamBytesFix(obj, arrayIdx, size, valUint8List.pointer);
        valUint8List.dispose();

        return result;
    }
}
