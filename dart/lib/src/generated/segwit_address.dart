// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class SegwitAddress implements Disposable, Address {
  final Pointer<TWSegwitAddress> _pointer;

  Pointer<TWSegwitAddress> get pointer => _pointer;

  const SegwitAddress._(Pointer<TWSegwitAddress> pointer) : _pointer = pointer;

  @override
  bool operator == (Object other) => switch(other) {
    SegwitAddress obj => _bindings.TWSegwitAddressEqual(_pointer, obj.pointer),
    _ => false,
  };

  @override
  int get hashCode => _pointer.hashCode;

  factory SegwitAddress.createWithString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWSegwitAddressCreateWithString(stringString.pointer);
      if (result == nullptr) {
        throw ArgumentError('SegwitAddress.createWithString: string=$string');
      }

      return SegwitAddress._(result);
    } finally {
      stringString.dispose();
    }
  }

  factory SegwitAddress.createWithPublicKey({
    required HRP hrp,
    required PublicKey publicKey,
  }) {
    final hrpEnum = TWHRP.fromValue(hrp.value);
    final publicKeyPublicKey = publicKey.pointer;
    final result = _bindings.TWSegwitAddressCreateWithPublicKey(hrpEnum, publicKeyPublicKey);

    return SegwitAddress._(result);
  }

  @override
  void dispose() {
    _bindings.TWSegwitAddressDelete(pointer);
  }

  static bool isValidString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    final result = _bindings.TWSegwitAddressIsValidString(stringString.pointer);
    stringString.dispose();

    return result;
  }
  @override
  String get description {
    final obj = pointer;
    final result = _bindings.TWSegwitAddressDescription(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
    
  HRP get hrp {
    final obj = pointer;
    final result = _bindings.TWSegwitAddressHRP(obj);

    return HRP.fromValue(result.value);
  }
    
  int get witnessVersion {
    final obj = pointer;
    final result = _bindings.TWSegwitAddressWitnessVersion(obj);

    return result;
  }
    
  Uint8List get witnessProgram {
    final obj = pointer;
    final result = _bindings.TWSegwitAddressWitnessProgram(obj);
    final wrapper = DataImpl.createWithPointer(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
  
}
