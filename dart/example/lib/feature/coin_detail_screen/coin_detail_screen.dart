import 'package:flutter/material.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/common/utils.dart';
import 'package:trust_wallet_core_example/data/factory/wallet_service_factory.dart';
import 'package:trust_wallet_core_example/data/wallets/bitcoin_wallet.dart';

class CoinDetailScreen extends StatelessWidget {
  final HDWallet hdWallet;
  final TWCoinType coinType;

  const CoinDetailScreen({
    super.key,
    required this.hdWallet,
    required this.coinType,
  });

  @override
  Widget build(BuildContext context) {
    final address = hdWallet.getAddressForCoin(coinType);

    return Scaffold(
      appBar: AppBar(
        title: Text(Utils.getCoinName(coinType)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (coinType == TWCoinType.TWCoinTypeBitcoin) ...[
                FutureBuilder(
                  future: WalletServiceFactory.getService<BitcoinWallet>(context, hdWallet).getBalance(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    final balance = snapshot.data ?? '?';
                    return Text(
                      'Balance: $balance BTC',
                      style: const TextStyle(fontSize: 24),
                    );
                  },
                ),
                const SizedBox(height: 32),
              ],
              // if (coinType == TWCoinType.TWCoinTypeEthereum) ...[
              //   FutureBuilder(
              //     future: WalletServiceFactory.getService<EthereumWallet>(context).getBalance(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const CircularProgressIndicator();
              //       }

              //       final balance = snapshot.data ?? '?';
              //       return Text(
              //         'Balance: $balance ETH',
              //         style: const TextStyle(fontSize: 24),
              //       );
              //     },
              //   ),
              //   const SizedBox(height: 32),
              // ],
              // QrImageView(
              //   data: address,
              //   size: 200,
              // ),
              const SizedBox(height: 24),
              Text(
                address,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              if (coinType == TWCoinType.TWCoinTypeBitcoin || coinType == TWCoinType.TWCoinTypeEthereum) ...[
                const SizedBox(height: 32),
                // ElevatedButton(
                //   onPressed: () => _openBitcoinScreen(context, coinType),
                //   child: const Text('Send'),
                // ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // void _openBitcoinScreen(BuildContext context, TWCoinType coinType) => Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => BitcoinTransactionScreen(
  //           coinType: coinType,
  //         ),
  //       ),
  //     );
}
