// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class TezosMessageSigner {

  static String formatMessage({
    required String message,
    required String url,
  }) {
    final messageString = StringImpl.createWithString(message);
    final urlString = StringImpl.createWithString(url);
    final result = _bindings.TWTezosMessageSignerFormatMessage(messageString.pointer, urlString.pointer);
    messageString.dispose();
    urlString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String inputToPayload({
    required String message,
  }) {
    final messageString = StringImpl.createWithString(message);
    final result = _bindings.TWTezosMessageSignerInputToPayload(messageString.pointer);
    messageString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String signMessage({
    required PrivateKey privateKey,
    required String message,
  }) {
    final privateKeyPrivateKey = privateKey.pointer;
    final messageString = StringImpl.createWithString(message);
    final result = _bindings.TWTezosMessageSignerSignMessage(privateKeyPrivateKey, messageString.pointer);
    messageString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static bool verifyMessage({
    required PublicKey pubKey,
    required String message,
    required String signature,
  }) {
    final pubKeyPublicKey = pubKey.pointer;
    final messageString = StringImpl.createWithString(message);
    final signatureString = StringImpl.createWithString(signature);
    final result = _bindings.TWTezosMessageSignerVerifyMessage(pubKeyPublicKey, messageString.pointer, signatureString.pointer,);
    messageString.dispose();
    signatureString.dispose();

    return result;
  }

}
