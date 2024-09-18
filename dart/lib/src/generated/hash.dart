// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class Hash {
  static Uint8List sha1({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashSHA1(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List sha256({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashSHA256(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List sha512({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashSHA512(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List sha512_256({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashSHA512_256(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List keccak256({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashKeccak256(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List keccak512({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashKeccak512(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List sha3_256({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashSHA3_256(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List sha3512({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashSHA3_512(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List RIPEMD({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashRIPEMD(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List blake256({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashBlake256(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List blake2b({
    required Uint8List data,
    required int size,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashBlake2b(dataUint8List.pointer, size);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List groestl512({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashGroestl512(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List sha256SHA256({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashSHA256SHA256(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List sha256RIPEMD({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashSHA256RIPEMD(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List sha3_256RIPEMD({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashSHA3_256RIPEMD(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List blake256Blake256({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashBlake256Blake256(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List blake256RIPEMD({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashBlake256RIPEMD(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

  static Uint8List groestl512Groestl512({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWHashGroestl512Groestl512(dataUint8List.pointer);
    dataUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
}
