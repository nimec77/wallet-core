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

  const EthereumAbiFunction._(Pointer<TWEthereumAbiFunction> pointer)
      : _pointer = pointer;

  factory EthereumAbiFunction.createWithString({
    required String name,
  }) {
    final nameString = StringImpl.createWithString(name);
    final result =
        _bindings.TWEthereumAbiFunctionCreateWithString(nameString.pointer);
    nameString.dispose();

    return EthereumAbiFunction._(result);
  }

  @override
  void dispose() {
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

  int addParamUInt8({
    required int val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddParamUInt8(obj, val, isOutput);

    return result;
  }

  int addParamUInt16({
    required int val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddParamUInt16(obj, val, isOutput);

    return result;
  }

  int addParamUInt32({
    required int val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddParamUInt32(obj, val, isOutput);

    return result;
  }

  int addParamUInt64({
    required int val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddParamUInt64(obj, val, isOutput);

    return result;
  }

  int addParamUInt256({
    required Uint8List val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddParamUInt256(
        obj, valUint8List.pointer, isOutput);
    valUint8List.dispose();

    return result;
  }

  int addParamUIntN({
    required int bits,
    required Uint8List val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddParamUIntN(
        obj, bits, valUint8List.pointer, isOutput);
    valUint8List.dispose();

    return result;
  }

  int addParamInt8({
    required int val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddParamInt8(obj, val, isOutput);

    return result;
  }

  int addParamInt16({
    required int val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddParamInt16(obj, val, isOutput);

    return result;
  }

  int addParamInt32({
    required int val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddParamInt32(obj, val, isOutput);

    return result;
  }

  int addParamInt64({
    required int val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddParamInt64(obj, val, isOutput);

    return result;
  }

  int addParamInt256({
    required Uint8List val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddParamInt256(
        obj, valUint8List.pointer, isOutput);
    valUint8List.dispose();

    return result;
  }

  int addParamIntN({
    required int bits,
    required Uint8List val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddParamIntN(
        obj, bits, valUint8List.pointer, isOutput);
    valUint8List.dispose();

    return result;
  }

  int addParamBool({
    required bool val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddParamBool(obj, val, isOutput);

    return result;
  }

  int addParamString({
    required String val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final valString = StringImpl.createWithString(val);
    final result = _bindings.TWEthereumAbiFunctionAddParamString(
        obj, valString.pointer, isOutput);
    valString.dispose();

    return result;
  }

  int addParamAddress({
    required Uint8List val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddParamAddress(
        obj, valUint8List.pointer, isOutput);
    valUint8List.dispose();

    return result;
  }

  int addParamBytes({
    required Uint8List val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddParamBytes(
        obj, valUint8List.pointer, isOutput);
    valUint8List.dispose();

    return result;
  }

  int addParamBytesFix({
    required int size,
    required Uint8List val,
    required bool isOutput,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddParamBytesFix(
        obj, size, valUint8List.pointer, isOutput);
    valUint8List.dispose();

    return result;
  }

  int addParamArray({
    required bool isOutput,
  }) {
    final obj = pointer;
    final result = _bindings.TWEthereumAbiFunctionAddParamArray(obj, isOutput);

    return result;
  }

  int getParamUInt8({
    required int idx,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionGetParamUInt8(obj, idx, isOutput);

    return result;
  }

  int getParamUInt64({
    required int idx,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionGetParamUInt64(obj, idx, isOutput);

    return result;
  }

  Uint8List getParamUInt256({
    required int idx,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionGetParamUInt256(obj, idx, isOutput);
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  bool getParamBool({
    required int idx,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionGetParamBool(obj, idx, isOutput);

    return result;
  }

  String getParamString({
    required int idx,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionGetParamString(obj, idx, isOutput);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  Uint8List getParamAddress({
    required int idx,
    required bool isOutput,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionGetParamAddress(obj, idx, isOutput);
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  int addInArrayParamUInt8({
    required int arrayIdx,
    required int val,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddInArrayParamUInt8(obj, arrayIdx, val);

    return result;
  }

  int addInArrayParamUInt16({
    required int arrayIdx,
    required int val,
  }) {
    final obj = pointer;
    final result = _bindings.TWEthereumAbiFunctionAddInArrayParamUInt16(
        obj, arrayIdx, val);

    return result;
  }

  int addInArrayParamUInt32({
    required int arrayIdx,
    required int val,
  }) {
    final obj = pointer;
    final result = _bindings.TWEthereumAbiFunctionAddInArrayParamUInt32(
        obj, arrayIdx, val);

    return result;
  }

  int addInArrayParamUInt64({
    required int arrayIdx,
    required int val,
  }) {
    final obj = pointer;
    final result = _bindings.TWEthereumAbiFunctionAddInArrayParamUInt64(
        obj, arrayIdx, val);

    return result;
  }

  int addInArrayParamUInt256({
    required int arrayIdx,
    required Uint8List val,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddInArrayParamUInt256(
        obj, arrayIdx, valUint8List.pointer);
    valUint8List.dispose();

    return result;
  }

  int addInArrayParamUIntN({
    required int arrayIdx,
    required int bits,
    required Uint8List val,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddInArrayParamUIntN(
        obj, arrayIdx, bits, valUint8List.pointer);
    valUint8List.dispose();

    return result;
  }

  int addInArrayParamInt8({
    required int arrayIdx,
    required int val,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddInArrayParamInt8(obj, arrayIdx, val);

    return result;
  }

  int addInArrayParamInt16({
    required int arrayIdx,
    required int val,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddInArrayParamInt16(obj, arrayIdx, val);

    return result;
  }

  int addInArrayParamInt32({
    required int arrayIdx,
    required int val,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddInArrayParamInt32(obj, arrayIdx, val);

    return result;
  }

  int addInArrayParamInt64({
    required int arrayIdx,
    required int val,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddInArrayParamInt64(obj, arrayIdx, val);

    return result;
  }

  int addInArrayParamInt256({
    required int arrayIdx,
    required Uint8List val,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddInArrayParamInt256(
        obj, arrayIdx, valUint8List.pointer);
    valUint8List.dispose();

    return result;
  }

  int addInArrayParamIntN({
    required int arrayIdx,
    required int bits,
    required Uint8List val,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddInArrayParamIntN(
        obj, arrayIdx, bits, valUint8List.pointer);
    valUint8List.dispose();

    return result;
  }

  int addInArrayParamBool({
    required int arrayIdx,
    required bool val,
  }) {
    final obj = pointer;
    final result =
        _bindings.TWEthereumAbiFunctionAddInArrayParamBool(obj, arrayIdx, val);

    return result;
  }

  int addInArrayParamString({
    required int arrayIdx,
    required String val,
  }) {
    final obj = pointer;
    final valString = StringImpl.createWithString(val);
    final result = _bindings.TWEthereumAbiFunctionAddInArrayParamString(
        obj, arrayIdx, valString.pointer);
    valString.dispose();

    return result;
  }

  int addInArrayParamAddress({
    required int arrayIdx,
    required Uint8List val,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddInArrayParamAddress(
        obj, arrayIdx, valUint8List.pointer);
    valUint8List.dispose();

    return result;
  }

  int addInArrayParamBytes({
    required int arrayIdx,
    required Uint8List val,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddInArrayParamBytes(
        obj, arrayIdx, valUint8List.pointer);
    valUint8List.dispose();

    return result;
  }

  int addInArrayParamBytesFix({
    required int arrayIdx,
    required int size,
    required Uint8List val,
  }) {
    final obj = pointer;
    final valUint8List = DataImpl.createWithBytes(val);
    final result = _bindings.TWEthereumAbiFunctionAddInArrayParamBytesFix(
        obj, arrayIdx, size, valUint8List.pointer);
    valUint8List.dispose();

    return result;
  }
}
