// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class THORChainSwap {

  static Uint8List buildSwap({
    required Uint8List input,
  }) {
    final inputUint8List = DataImpl.createWithBytes(input);
    final result = _bindings.TWTHORChainSwapBuildSwap(inputUint8List.pointer);
    inputUint8List.dispose();
    final wrapper = DataImpl.createWithData(result);
    final val = wrapper.bytes;
    wrapper.dispose();

    return val;
  }

}
