// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class NervosAddress implements Disposable, Address {
  final Pointer<TWNervosAddress> _pointer;

  Pointer<TWNervosAddress> get pointer => _pointer;

  const NervosAddress._(Pointer<TWNervosAddress> pointer) : _pointer = pointer;

  @override
  bool operator == (Object other) => switch(other) {
    NervosAddress obj => _bindings.TWNervosAddressEqual(_pointer, obj.pointer),
    _ => false,
  };

  @override
  int get hashCode => _pointer.hashCode;

  factory NervosAddress.createWithString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWNervosAddressCreateWithString(stringString.pointer);
      if (result == nullptr) {
        throw ArgumentError('NervosAddress.createWithString: string=$string');
      }

      return NervosAddress._(result);
    } finally {
      stringString.dispose();
    }
  }

  @override
  void dispose() {
    _bindings.TWNervosAddressDelete(pointer);
  }

  static bool isValidString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    final result = _bindings.TWNervosAddressIsValidString(stringString.pointer);
    stringString.dispose();

    return result;
  }
  @override
  String get description {
    final obj = pointer;
    final result = _bindings.TWNervosAddressDescription(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
    
  Uint8List get codeHash {
    final obj = pointer;
    final result = _bindings.TWNervosAddressCodeHash(obj);
    final wrapper = DataImpl.createWithPointer(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
    
  String get hashType {
    final obj = pointer;
    final result = _bindings.TWNervosAddressHashType(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
    
  Uint8List get args {
    final obj = pointer;
    final result = _bindings.TWNervosAddressArgs(obj);
    final wrapper = DataImpl.createWithPointer(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }
  
}
