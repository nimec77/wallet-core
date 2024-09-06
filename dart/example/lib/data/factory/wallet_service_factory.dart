import 'package:flutter/material.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/data/abstractions/base_blockchain_wallet.dart';
import 'package:trust_wallet_core_example/data/services/wallet_service.dart';
import 'package:trust_wallet_core_example/data/wallets/bitcoin_wallet.dart';
import 'package:trust_wallet_core_example/data/wallets/ethereum_wallet.dart';
import 'package:trust_wallet_core_example/di/dependency_scope.dart';

abstract class WalletServiceFactory {
  static WalletService getService<T extends BlockchainWallet>(
    BuildContext context,
    HDWallet hdWallet,
  ) {
    final http = DependencyScope.of(context).http;

    final blockchainWallet = switch (T) {
      const (BitcoinWallet) => BitcoinWallet(
          hdWallet: hdWallet,
          http: http,
        ),
      const (EthereumWallet) => EthereumWallet(
          hdWallet: hdWallet,
          http: http,
        ),
      _ => throw Exception('Unknown wallet type'),
    };

    return WalletServiceImpl(blockchainWallet: blockchainWallet);
  }
}
