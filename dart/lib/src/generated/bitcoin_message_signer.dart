// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class BitcoinMessageSigner {
  static String signMessage({
    required PrivateKey privateKey,
    required String address,
    required String message,
  }) {
    final privateKeyPrivateKey = privateKey.pointer;
    final addressString = StringImpl.createWithString(address);
    final messageString = StringImpl.createWithString(message);
    final result = _bindings.TWBitcoinMessageSignerSignMessage(
      privateKeyPrivateKey,
      addressString.pointer,
      messageString.pointer,
    );
    addressString.dispose();
    messageString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static bool verifyMessage({
    required String address,
    required String message,
    required String signature,
  }) {
    final addressString = StringImpl.createWithString(address);
    final messageString = StringImpl.createWithString(message);
    final signatureString = StringImpl.createWithString(signature);
    final result = _bindings.TWBitcoinMessageSignerVerifyMessage(
      addressString.pointer,
      messageString.pointer,
      signatureString.pointer,
    );
    addressString.dispose();
    messageString.dispose();
    signatureString.dispose();

    return result;
  }
}
