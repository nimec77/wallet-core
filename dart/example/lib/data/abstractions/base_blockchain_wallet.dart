import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';

abstract interface class BlockchainWallet {
  String getAddressForCoin(CoinType coinType);
  Uint8List getKeyForCoin(CoinType coinType);

  Future<String> sendTransaction({
    required String toAddress,
    required String amount,
  });

  Future<double> getBalance();
}

abstract base class BaseBlockchainWallet implements BlockchainWallet {
  @mustCallSuper
  final HDWallet _hdWallet;

  const BaseBlockchainWallet({
    required HDWallet hdWallet,
  }) : _hdWallet = hdWallet;

  @override
  @nonVirtual
  String getAddressForCoin(CoinType coinType) => _hdWallet.getAddressForCoin(coin: coinType);

  @override
  @nonVirtual
  Uint8List getKeyForCoin(CoinType coinType) {
    final privateKey = _hdWallet.getKeyForCoin(coin: coinType);
    final privateKeyBytes = privateKey.data;
    privateKey.dispose();
    return privateKeyBytes;
  }

  @override
  Future<double> getBalance();

  @override
  Future<String> sendTransaction({
    required String toAddress,
    required String amount,
  });
}
