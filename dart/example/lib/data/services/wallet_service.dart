import 'package:trust_wallet_core_example/data/abstractions/base_blockchain_wallet.dart';

abstract interface class WalletService {
  Future<double> getBalance();

  Future<String> sendTransaction({
    required String toAddress,
    required String amount,
  });
}

class WalletServiceImpl implements WalletService {
  final BlockchainWallet _blockchainWallet;

  const WalletServiceImpl({required BlockchainWallet blockchainWallet}) : _blockchainWallet = blockchainWallet;

  @override
  Future<double> getBalance() => _blockchainWallet.getBalance();

  @override
  Future<String> sendTransaction({
    required String toAddress,
    required String amount,
  }) =>
      _blockchainWallet.sendTransaction(
        toAddress: toAddress,
        amount: amount,
      );
}
