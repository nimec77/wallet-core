// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class FIOAccount implements Disposable {
  final Pointer<TWFIOAccount> _pointer;

  Pointer<TWFIOAccount> get pointer => _pointer;

  const FIOAccount._(Pointer<TWFIOAccount> pointer) : _pointer = pointer;

  factory FIOAccount.createWithString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWFIOAccountCreateWithString(stringString.pointer);
      if (result == nullptr) {
        throw ArgumentError('FIOAccount.createWithString: string=$string');
      }

      return FIOAccount._(result);
    } finally {
      stringString.dispose();
    }
  }

  @override
  void dispose() {
    _bindings.TWFIOAccountDelete(pointer);
  }
  
  String get description {
    final obj = pointer;
    final result = _bindings.TWFIOAccountDescription(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
  
}
