// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class CoinTypeConfiguration {
  static String getSymbol({
    required CoinType type,
  }) {
    final typeEnum = TWCoinType.fromValue(type.value);
    final result = _bindings.TWCoinTypeConfigurationGetSymbol(typeEnum);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static int getDecimals({
    required CoinType type,
  }) {
    final typeEnum = TWCoinType.fromValue(type.value);
    final result = _bindings.TWCoinTypeConfigurationGetDecimals(typeEnum);

    return result;
  }

  static String getTransactionUrl({
    required CoinType type,
    required String transactionID,
  }) {
    final typeEnum = TWCoinType.fromValue(type.value);
    final transactionIdString = StringImpl.createWithString(transactionID);
    final result = _bindings.TWCoinTypeConfigurationGetTransactionURL(
        typeEnum, transactionIdString.pointer);
    transactionIdString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String getAccountUrl({
    required CoinType type,
    required String accountID,
  }) {
    final typeEnum = TWCoinType.fromValue(type.value);
    final accountIdString = StringImpl.createWithString(accountID);
    final result = _bindings.TWCoinTypeConfigurationGetAccountURL(
        typeEnum, accountIdString.pointer);
    accountIdString.dispose();
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String getId({
    required CoinType type,
  }) {
    final typeEnum = TWCoinType.fromValue(type.value);
    final result = _bindings.TWCoinTypeConfigurationGetID(typeEnum);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }

  static String getName({
    required CoinType type,
  }) {
    final typeEnum = TWCoinType.fromValue(type.value);
    final result = _bindings.TWCoinTypeConfigurationGetName(typeEnum);
    final wrapper = StringImpl.createWithPointer(result);
    final val = wrapper.dartString;
    wrapper.dispose();

    return val;
  }
}
