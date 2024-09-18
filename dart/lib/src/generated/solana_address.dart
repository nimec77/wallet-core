// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class SolanaAddress implements Disposable, Address {
  final Pointer<TWSolanaAddress> _pointer;

  Pointer<TWSolanaAddress> get pointer => _pointer;

  const SolanaAddress._(Pointer<TWSolanaAddress> pointer) : _pointer = pointer;

  factory SolanaAddress.createWithString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWSolanaAddressCreateWithString(stringString.pointer);
      if (result == nullptr) {
        throw ArgumentError('SolanaAddress.createWithString: string=$string');
      }

      return SolanaAddress._(result);
    } finally {
      stringString.dispose();
    }
  }

  @override
  void dispose() {
    _bindings.TWSolanaAddressDelete(pointer);
  }

  String? defaultTokenAddress({
    required String tokenMintAddress,
  }) {
    final obj = pointer;
    final tokenMintAddressString = StringImpl.createWithString(tokenMintAddress);
    try {
      final result = _bindings.TWSolanaAddressDefaultTokenAddress(obj, tokenMintAddressString.pointer);
      if (result == nullptr) {
        return null;
      }
      final wrapper = StringImpl.createWithPointer(result);
      final val = wrapper.dartString;
      wrapper.dispose();

      return val;
    } finally {
      tokenMintAddressString.dispose();
    }
  }
  @override
  String get description {
    final obj = pointer;
    final result = _bindings.TWSolanaAddressDescription(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
  
}
