// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class CoinTypeConfiguration {

    static String getSymbol(CoinType type) {
        final typeEnum = TWCoinType.fromValue(type.value);
        final result = _bindings.TWCoinTypeConfigurationGetSymbol(typeEnum);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    static int getDecimals(CoinType type) {
        final typeEnum = TWCoinType.fromValue(type.value);
        final result = _bindings.TWCoinTypeConfigurationGetDecimals(typeEnum);

        return result;
    }

    static String getTransactionUrl(CoinType type, String transactionID) {
        final typeEnum = TWCoinType.fromValue(type.value);
        final transactionIdString = StringImpl.createWithString(transactionID);
        final result = _bindings.TWCoinTypeConfigurationGetTransactionURL(typeEnum, transactionIdString.pointer);
        transactionIdString.dispose();
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    static String getAccountUrl(CoinType type, String accountID) {
        final typeEnum = TWCoinType.fromValue(type.value);
        final accountIdString = StringImpl.createWithString(accountID);
        final result = _bindings.TWCoinTypeConfigurationGetAccountURL(typeEnum, accountIdString.pointer);
        accountIdString.dispose();
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    static String getId(CoinType type) {
        final typeEnum = TWCoinType.fromValue(type.value);
        final result = _bindings.TWCoinTypeConfigurationGetID(typeEnum);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    static String getName(CoinType type) {
        final typeEnum = TWCoinType.fromValue(type.value);
        final result = _bindings.TWCoinTypeConfigurationGetName(typeEnum);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }
}
