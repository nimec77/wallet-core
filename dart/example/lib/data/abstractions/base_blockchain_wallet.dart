import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/data/hd_wallet.dart';

abstract interface class BlockchainWallet {
  Uint8List sign(
    Uint8List bytes,
    TWCoinType coin,
  );

  String getAddressForCoin(TWCoinType coinType);

  Future<String> sendTransaction({
    required String toAddress,
    required String amount,
  });

  Future<double> getBalance();
}

abstract base class BaseBlockchainWallet implements BlockchainWallet {
  final TrustWalletCoreBindings _bindings;
  final HdWallet _hdWallet;

  const BaseBlockchainWallet({
    required TrustWalletCoreBindings bindings,
    required HdWallet hdWallet,
  })  : _bindings = bindings,
        _hdWallet = hdWallet;

  @override
  @nonVirtual
  Uint8List sign(Uint8List bytes, TWCoinType coin) {
    final data = DataImpl.createWithBytes(_bindings, bytes);
    final signer = _bindings.TWAnySignerSign(data.pointer, coin);
    data.dispose();

    final dataSigner = DataImpl.createWithData(_bindings, signer);
    final signResult = dataSigner.bytes;
    dataSigner.dispose();

    return signResult;
  }

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
