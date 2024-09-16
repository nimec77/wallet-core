// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class EthereumAbiValue {
  static Uint8List encodeBool({
    required bool value,
  }) {
    final result = _bindings.TWEthereumAbiValueEncodeBool(value);
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List encodeInt32({
    required int value,
  }) {
    final result = _bindings.TWEthereumAbiValueEncodeInt32(value);
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List encodeUInt32({
    required int value,
  }) {
    final result = _bindings.TWEthereumAbiValueEncodeUInt32(value);
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List encodeInt256({
    required Uint8List value,
  }) {
    final valueUint8List = DataImpl.createWithBytes(value);
    final result =
        _bindings.TWEthereumAbiValueEncodeInt256(valueUint8List.pointer);
    valueUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List encodeUInt256({
    required Uint8List value,
  }) {
    final valueUint8List = DataImpl.createWithBytes(value);
    final result =
        _bindings.TWEthereumAbiValueEncodeUInt256(valueUint8List.pointer);
    valueUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List encodeAddress({
    required Uint8List value,
  }) {
    final valueUint8List = DataImpl.createWithBytes(value);
    final result =
        _bindings.TWEthereumAbiValueEncodeAddress(valueUint8List.pointer);
    valueUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List encodeString({
    required String value,
  }) {
    final valueString = StringImpl.createWithString(value);
    final result =
        _bindings.TWEthereumAbiValueEncodeString(valueString.pointer);
    valueString.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List encodeBytes({
    required Uint8List value,
  }) {
    final valueUint8List = DataImpl.createWithBytes(value);
    final result =
        _bindings.TWEthereumAbiValueEncodeBytes(valueUint8List.pointer);
    valueUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List encodeBytesDyn({
    required Uint8List value,
  }) {
    final valueUint8List = DataImpl.createWithBytes(value);
    final result =
        _bindings.TWEthereumAbiValueEncodeBytesDyn(valueUint8List.pointer);
    valueUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static String decodeUInt256({
    required Uint8List input,
  }) {
    final inputUint8List = DataImpl.createWithBytes(input);
    final result =
        _bindings.TWEthereumAbiValueDecodeUInt256(inputUint8List.pointer);
    inputUint8List.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String decodeValue({
    required Uint8List input,
    required String type,
  }) {
    final inputUint8List = DataImpl.createWithBytes(input);
    final typeString = StringImpl.createWithString(type);
    final result = _bindings.TWEthereumAbiValueDecodeValue(
        inputUint8List.pointer, typeString.pointer);
    inputUint8List.dispose();
    typeString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String decodeArray({
    required Uint8List input,
    required String type,
  }) {
    final inputUint8List = DataImpl.createWithBytes(input);
    final typeString = StringImpl.createWithString(type);
    final result = _bindings.TWEthereumAbiValueDecodeArray(
        inputUint8List.pointer, typeString.pointer);
    inputUint8List.dispose();
    typeString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
}
