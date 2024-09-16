// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class StarkExMessageSigner {

  static String signMessage({
    required PrivateKey privateKey,
    required String message,
  }) {
    final privateKeyPrivateKey = privateKey.pointer;
    final messageString = StringImpl.createWithString(message);
    final result = _bindings.TWStarkExMessageSignerSignMessage(privateKeyPrivateKey, messageString.pointer);
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
    final result = _bindings.TWStarkExMessageSignerVerifyMessage(pubKeyPublicKey, messageString.pointer, signatureString.pointer,);
    messageString.dispose();
    signatureString.dispose();

    return result;
  }

}
