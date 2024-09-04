import 'package:meta/meta.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/data/hd_wallet.dart';

abstract interface class BlockchainWallet {
  String getAddressForCoin(TWCoinType coinType);

  Future<String> sendTransaction({
    required String toAddress,
    required String amount,
  });

  Future<double> getBalance();
}

abstract base class BaseBlockchainWallet implements BlockchainWallet {
  final HdWallet _hdWallet;

  const BaseBlockchainWallet({
    required HdWallet hdWallet,
  }) : _hdWallet = hdWallet;

  @override
  @nonVirtual
  String getAddressForCoin(TWCoinType coinType) => _hdWallet.getAddressForCoin(coinType);

  @override
  Future<double> getBalance();

  @override
  Future<String> sendTransaction({
    required String toAddress,
    required String amount,
  });
}
