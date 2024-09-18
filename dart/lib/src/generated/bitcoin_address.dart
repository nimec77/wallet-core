// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class BitcoinAddress implements Disposable, Address {
  final Pointer<TWBitcoinAddress> _pointer;

  Pointer<TWBitcoinAddress> get pointer => _pointer;

  const BitcoinAddress._(Pointer<TWBitcoinAddress> pointer) : _pointer = pointer;

  @override
  bool operator == (Object other) => switch(other) {
    BitcoinAddress obj => _bindings.TWBitcoinAddressEqual(_pointer, obj.pointer),
    _ => false,
  };

  @override
  int get hashCode => _pointer.hashCode;

  factory BitcoinAddress.createWithString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWBitcoinAddressCreateWithString(stringString.pointer);
      if (result == nullptr) {
        throw ArgumentError('BitcoinAddress.createWithString: string=$string');
      }

      return BitcoinAddress._(result);
    } finally {
      stringString.dispose();
    }
  }

  factory BitcoinAddress.createWithData({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    try {
      final result = _bindings.TWBitcoinAddressCreateWithData(dataUint8List.pointer);
      if (result == nullptr) {
        throw ArgumentError('BitcoinAddress.createWithData: data=$data');
      }

      return BitcoinAddress._(result);
    } finally {
      dataUint8List.dispose();
    }
  }

  factory BitcoinAddress.createWithPublicKey({
    required PublicKey publicKey,
    required int prefix,
  }) {
    final publicKeyPublicKey = publicKey.pointer;
    final result = _bindings.TWBitcoinAddressCreateWithPublicKey(publicKeyPublicKey, prefix);
    if (result == nullptr) {
      throw ArgumentError('BitcoinAddress.createWithPublicKey: publicKey=$publicKey, prefix=$prefix');
    }

    return BitcoinAddress._(result);
  }

  @override
  void dispose() {
    _bindings.TWBitcoinAddressDelete(pointer);
  }

  static bool isValid({
    required Uint8List data,
  }) {
    final dataUint8List = DataImpl.createWithBytes(data);
    final result = _bindings.TWBitcoinAddressIsValid(dataUint8List.pointer);
    dataUint8List.dispose();

    return result;
  }

  static bool isValidString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    final result = _bindings.TWBitcoinAddressIsValidString(stringString.pointer);
    stringString.dispose();

    return result;
  }
  @override
  String get description {
    final obj = pointer;
    final result = _bindings.TWBitcoinAddressDescription(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
    
  int get prefix {
    final obj = pointer;
    final result = _bindings.TWBitcoinAddressPrefix(obj);

    return result;
  }
    
  Uint8List get keyhash {
    final obj = pointer;
    final result = _bindings.TWBitcoinAddressKeyhash(obj);
    final wrapper = DataImpl.createWithPointer(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
  
}
