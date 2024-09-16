// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class DerivationPath implements Disposable {
  final Pointer<TWDerivationPath> _pointer;

  Pointer<TWDerivationPath> get pointer => _pointer;

  const DerivationPath._(Pointer<TWDerivationPath> pointer) : _pointer = pointer;

  factory DerivationPath.create({
    required Purpose purpose,
    required int coin,
    required int account,
    required int change,
    required int address,
  }) {
    final purposeEnum = TWPurpose.fromValue(purpose.value);
    final result = _bindings.TWDerivationPathCreate(purposeEnum, coin, account, change, address);

    return DerivationPath._(result);
  }

  factory DerivationPath.createWithString({
    required String string,
  }) {
    final stringString = StringImpl.createWithString(string);
    try {
      final result = _bindings.TWDerivationPathCreateWithString(stringString.pointer);
      if (result == nullptr) {
        throw ArgumentError('DerivationPath.createWithString: string=$string');
      }

      return DerivationPath._(result);
    } finally {
      stringString.dispose();
    }
  }

  @override
  void dispose() {
    _bindings.TWDerivationPathDelete(pointer);
  }

  DerivationPathIndex? indexAt({
    required int index,
  }) {
    final obj = pointer;
    final result = _bindings.TWDerivationPathIndexAt(obj, index);
    if (result == nullptr) {
      return null;
    }

    return DerivationPathIndex._(result);
  }

  int indicesCount() {
    final obj = pointer;
    final result = _bindings.TWDerivationPathIndicesCount(obj);

    return result;
  }
  
  Purpose get purpose {
    final obj = pointer;
    final result = _bindings.TWDerivationPathPurpose(obj);

    return Purpose.fromValue(result.value);
  }
    
  int get coin {
    final obj = pointer;
    final result = _bindings.TWDerivationPathCoin(obj);

    return result;
  }
    
  int get account {
    final obj = pointer;
    final result = _bindings.TWDerivationPathAccount(obj);

    return result;
  }
    
  int get change {
    final obj = pointer;
    final result = _bindings.TWDerivationPathChange(obj);

    return result;
  }
    
  int get address {
    final obj = pointer;
    final result = _bindings.TWDerivationPathAddress(obj);

    return result;
  }
    
  String get description {
    final obj = pointer;
    final result = _bindings.TWDerivationPathDescription(obj);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
  
}
