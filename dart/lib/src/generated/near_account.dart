// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class NEARAccount implements Disposable {
  final Pointer<TWNEARAccount> _pointer;

  Pointer<TWNEARAccount> get pointer => _pointer;

  const NEARAccount._(Pointer<TWNEARAccount> pointer) : _pointer = pointer;

  factory NEARAccount.createWithString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result =
          _bindings.TWNEARAccountCreateWithString(stringString.pointer);
      if (result == nullptr) {
        throw ArgumentError('NEARAccount.createWithString: string=$string');
      }

      return NEARAccount._(result);
    } finally {
      stringString.dispose();
    }
  }

  @override
  void dispose() {
    _bindings.TWNEARAccountDelete(pointer);
  }

  String get description {
    final obj = pointer;
    final result = _bindings.TWNEARAccountDescription(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
}
