// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class GroestlcoinAddress implements Disposable, Address {
  final Pointer<TWGroestlcoinAddress> _pointer;

  Pointer<TWGroestlcoinAddress> get pointer => _pointer;

  const GroestlcoinAddress._(Pointer<TWGroestlcoinAddress> pointer) : _pointer = pointer;

  @override
  bool operator ==(Object other) => switch (other) {
        GroestlcoinAddress obj => _bindings.TWGroestlcoinAddressEqual(_pointer, obj.pointer),
        _ => false,
      };

  @override
  int get hashCode => _pointer.hashCode;

  factory GroestlcoinAddress.createWithString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWGroestlcoinAddressCreateWithString(stringString.pointer);
      if (result == nullptr) {
        throw ArgumentError('GroestlcoinAddress.createWithString: string=$string');
      }

      return GroestlcoinAddress._(result);
    } finally {
      stringString.dispose();
    }
  }

  factory GroestlcoinAddress.createWithPublicKey({
    required PublicKey publicKey,
    required int prefix,
  }) {
    final publicKeyPublicKey = publicKey.pointer;
    final result = _bindings.TWGroestlcoinAddressCreateWithPublicKey(publicKeyPublicKey, prefix);

    return GroestlcoinAddress._(result);
  }

  @override
  void dispose() {
    _bindings.TWGroestlcoinAddressDelete(pointer);
  }

  static bool isValidString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    final result = _bindings.TWGroestlcoinAddressIsValidString(stringString.pointer);
    stringString.dispose();

    return result;
  }

  @override
  String get description {
    final obj = pointer;
    final result = _bindings.TWGroestlcoinAddressDescription(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
}
