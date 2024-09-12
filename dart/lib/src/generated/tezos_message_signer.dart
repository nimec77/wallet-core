// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class TezosMessageSigner {

    static String formatMessage(String message, String url) {
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

    static String inputToPayload(String message) {
        final messageString = StringImpl.createWithString(message);
        final result = _bindings.TWTezosMessageSignerInputToPayload(messageString.pointer);
        messageString.dispose();
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    static String signMessage(PrivateKey privateKey, String message) {
        final privateKeyPrivateKey = privateKey.pointer;
        final messageString = StringImpl.createWithString(message);
        final result = _bindings.TWTezosMessageSignerSignMessage(privateKeyPrivateKey, messageString.pointer);
        messageString.dispose();
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    static bool verifyMessage(PublicKey pubKey, String message, String signature) {
        final pubKeyPublicKey = pubKey.pointer;
        final messageString = StringImpl.createWithString(message);
        final signatureString = StringImpl.createWithString(signature);
        final result = _bindings.TWTezosMessageSignerVerifyMessage(pubKeyPublicKey, messageString.pointer, signatureString.pointer);
        messageString.dispose();
        signatureString.dispose();

        return result;
    }
}
