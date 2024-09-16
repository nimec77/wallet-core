// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class EthereumMessageSigner {
  static String signTypedMessage({
    required PrivateKey privateKey,
    required String messageJson,
  }) {
    final privateKeyPrivateKey = privateKey.pointer;
    final messageJsonString = StringImpl.createWithString(messageJson);
    final result = _bindings.TWEthereumMessageSignerSignTypedMessage(
        privateKeyPrivateKey, messageJsonString.pointer);
    messageJsonString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String signTypedMessageEip155({
    required PrivateKey privateKey,
    required String messageJson,
    required int chainId,
  }) {
    final privateKeyPrivateKey = privateKey.pointer;
    final messageJsonString = StringImpl.createWithString(messageJson);
    final result = _bindings.TWEthereumMessageSignerSignTypedMessageEip155(
        privateKeyPrivateKey, messageJsonString.pointer, chainId);
    messageJsonString.dispose();
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
    final result = _bindings.TWEthereumMessageSignerSignMessage(
        privateKeyPrivateKey, messageString.pointer);
    messageString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String signMessageImmutableX({
    required PrivateKey privateKey,
    required String message,
  }) {
    final privateKeyPrivateKey = privateKey.pointer;
    final messageString = StringImpl.createWithString(message);
    final result = _bindings.TWEthereumMessageSignerSignMessageImmutableX(
        privateKeyPrivateKey, messageString.pointer);
    messageString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String signMessageEip155({
    required PrivateKey privateKey,
    required String message,
    required int chainId,
  }) {
    final privateKeyPrivateKey = privateKey.pointer;
    final messageString = StringImpl.createWithString(message);
    final result = _bindings.TWEthereumMessageSignerSignMessageEip155(
        privateKeyPrivateKey, messageString.pointer, chainId);
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
    final result = _bindings.TWEthereumMessageSignerVerifyMessage(
        pubKeyPublicKey, messageString.pointer, signatureString.pointer);
    messageString.dispose();
    signatureString.dispose();

    return result;
  }
}
