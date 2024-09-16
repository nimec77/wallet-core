// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class DataVector implements Disposable {
  final Pointer<TWDataVector> _pointer;

  Pointer<TWDataVector> get pointer => _pointer;

  const DataVector._(Pointer<TWDataVector> pointer) : _pointer = pointer;

  factory DataVector.create() {
    final result = _bindings.TWDataVectorCreate();

    return DataVector._(result);
  }

  factory DataVector.createWithData({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWDataVectorCreateWithData(dataUint8List.pointer);
    dataUint8List.dispose();

    return DataVector._(result);
  }

  @override
  void dispose() {
    _bindings.TWDataVectorDelete(pointer);
  }

  void add({
    required Uint8List data,
  }) {
    final obj = pointer;
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWDataVectorAdd(obj, dataUint8List.pointer);
    dataUint8List.dispose();

    return result;
  }

  Uint8List? get({
    required int index,
  }) {
    final obj = pointer;
    final result = _bindings.TWDataVectorGet(obj, index);
    if (result == nullptr) {
      return null;
    }
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
  
  int get size {
    final obj = pointer;
    final result = _bindings.TWDataVectorSize(obj);

    return result;
  }
  
}
