// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class FilecoinAddressConverter {

    static String convertToEthereum(String filecoinAddress) {
        final filecoinAddressString = StringImpl.createWithString(filecoinAddress);
        final result = _bindings.TWFilecoinAddressConverterConvertToEthereum(filecoinAddressString.pointer);
        filecoinAddressString.dispose();
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    static String convertFromEthereum(String ethAddress) {
        final ethAddressString = StringImpl.createWithString(ethAddress);
        final result = _bindings.TWFilecoinAddressConverterConvertFromEthereum(ethAddressString.pointer);
        ethAddressString.dispose();
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }
}
