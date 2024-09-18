// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class Ethereum {
  static String eip2645GetPath({
    required String ethAddress,
    required String layer,
    required String application,
    required String index,
  }) {
    final ethAddressString = StringImpl.createWithString(ethAddress);
    final layerString = StringImpl.createWithString(layer);
    final applicationString = StringImpl.createWithString(application);
    final indexString = StringImpl.createWithString(index);
    final result = _bindings.TWEthereumEip2645GetPath(
      ethAddressString.pointer,
      layerString.pointer,
      applicationString.pointer,
      indexString.pointer,
    );
    ethAddressString.dispose();
    layerString.dispose();
    applicationString.dispose();
    indexString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
}
