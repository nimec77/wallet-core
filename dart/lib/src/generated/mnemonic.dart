// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class Mnemonic {

    static bool isValid(String mnemonic) {
        final mnemonicString = StringImpl.createWithString(mnemonic);
        final result = _bindings.TWMnemonicIsValid(mnemonicString.pointer);
        mnemonicString.dispose();

        return result;
    }

    static bool isValidWord(String word) {
        final wordString = StringImpl.createWithString(word);
        final result = _bindings.TWMnemonicIsValidWord(wordString.pointer);
        wordString.dispose();

        return result;
    }

    static String suggest(String prefix) {
        final prefixString = StringImpl.createWithString(prefix);
        final result = _bindings.TWMnemonicSuggest(prefixString.pointer);
        prefixString.dispose();
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }
}
