import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';

abstract interface class BlockchainWallet {
  String getAddressForCoin(TWCoinType coinType);
  Uint8List getKeyForCoin(TWCoinType coinType);

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
  String getAddressForCoin(TWCoinType coinType) => _hdWallet.getAddressForCoin(coinType);

  @override
  @nonVirtual
  Uint8List getKeyForCoin(TWCoinType coinType) {
    //TODO: dispose privateKey
    final privateKey = _hdWallet.getKeyForCoin(coinType);
    return privateKey.data;
  }

  @override
  Future<double> getBalance();

  @override
  Future<String> sendTransaction({
    required String toAddress,
    required String amount,
  });
}
