import 'package:flutter/material.dart';
import 'package:trust_wallet_core_example/data/abstractions/base_blockchain_wallet.dart';
import 'package:trust_wallet_core_example/data/services/wallet_service.dart';
import 'package:trust_wallet_core_example/data/wallets/bitcoin_wallet.dart';
import 'package:trust_wallet_core_example/di/dependency_scope.dart';

abstract class WalletServiceFactory {
  static WalletService getService<T extends BlockchainWallet>(BuildContext context) {
    final http = DependencyScope.of(context).http;
    final hdWallet = DependencyScope.of(context).hdWallet;
    final bindings = DependencyScope.of(context).bindings;

    final blockchainWallet = switch (T) {
      const (BitcoinWallet) => BitcoinWallet(
          bindings: bindings,
          http: http,
          hdWallet: hdWallet,
        ),
      // const (EthereumWallet) => EthereumWallet(
      //     http: http,
      //     hdWallet: hdWallet,
      //   ),
      _ => throw Exception('Unknown wallet type'),
    };

    return WalletServiceImpl(blockchainWallet: blockchainWallet);
  }
}
