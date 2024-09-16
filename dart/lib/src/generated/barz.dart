// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class Barz {
  static String getCounterfactualAddress({
    required Uint8List input,
  }) {
    final inputUint8List = DataImpl.createWithBytes(input);
    final result = _bindings.TWBarzGetCounterfactualAddress(inputUint8List.pointer);
    inputUint8List.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
}
