// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class DerivationPathIndex implements Disposable {
  final Pointer<TWDerivationPathIndex> _pointer;

  Pointer<TWDerivationPathIndex> get pointer => _pointer;

  const DerivationPathIndex._(Pointer<TWDerivationPathIndex> pointer) : _pointer = pointer;

  factory DerivationPathIndex.create({
    required int value,
    required bool hardened,
  }) {
    final result = _bindings.TWDerivationPathIndexCreate(value, hardened);

    return DerivationPathIndex._(result);
  }

  @override
  void dispose() {
    _bindings.TWDerivationPathIndexDelete(pointer);
  }

  int get value {
    final obj = pointer;
    final result = _bindings.TWDerivationPathIndexValue(obj);

    return result;
  }

  bool get hardened {
    final obj = pointer;
    final result = _bindings.TWDerivationPathIndexHardened(obj);

    return result;
  }

  String get description {
    final obj = pointer;
    final result = _bindings.TWDerivationPathIndexDescription(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
}
