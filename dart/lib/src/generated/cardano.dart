// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class Cardano {
  static int minAdaAmount({
    required Uint8List tokenBundle,
  }) {
    final tokenBundleUint8List = DataImpl.createWithBytes(tokenBundle);
    final result =
        _bindings.TWCardanoMinAdaAmount(tokenBundleUint8List.pointer);
    tokenBundleUint8List.dispose();

    return result;
  }

  static String outputMinAdaAmount({
    required String toAddress,
    required Uint8List tokenBundle,
    required String coinsPerUtxoByte,
  }) {
    final toAddressString = StringImpl.createWithString(toAddress);
    final tokenBundleUint8List = DataImpl.createWithBytes(tokenBundle);
    final coinsPerUtxoByteString =
        StringImpl.createWithString(coinsPerUtxoByte);
    final result = _bindings.TWCardanoOutputMinAdaAmount(
        toAddressString.pointer,
        tokenBundleUint8List.pointer,
        coinsPerUtxoByteString.pointer);
    toAddressString.dispose();
    tokenBundleUint8List.dispose();
    coinsPerUtxoByteString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String getStakingAddress({
    required String baseAddress,
  }) {
    final baseAddressString = StringImpl.createWithString(baseAddress);
    final result =
        _bindings.TWCardanoGetStakingAddress(baseAddressString.pointer);
    baseAddressString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
}
