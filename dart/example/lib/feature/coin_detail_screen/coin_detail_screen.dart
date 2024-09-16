import 'package:flutter/material.dart';
import 'package:http_interceptor/http/intercepted_http.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/data/factory/wallet_service_factory.dart';
import 'package:trust_wallet_core_example/data/services/wallet_service.dart';
import 'package:trust_wallet_core_example/data/wallets/bitcoin_wallet.dart';
import 'package:trust_wallet_core_example/data/wallets/ethereum_wallet.dart';
import 'package:trust_wallet_core_example/di/dependency_scope.dart';
import 'package:trust_wallet_core_example/feature/transaction_screen/transaction_screen.dart';

class CoinDetailScreen extends StatefulWidget {
  final HDWallet hdWallet;
  final CoinType coinType;

  const CoinDetailScreen({
    super.key,
    required this.hdWallet,
    required this.coinType,
  });

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  late final InterceptedHttp httpClient;
  late final WalletService walletService;
  late final String address;

  HDWallet get hdWallet => widget.hdWallet;

  @override
  void initState() {
    super.initState();

    httpClient = DependencyScope.of(context).http;

    walletService = switch (widget.coinType) {
      const (CoinType.bitcoin) => WalletServiceFactory.getService<BitcoinWallet>(
          httpClient,
          hdWallet,
        ),
      const (CoinType.ethereum) => WalletServiceFactory.getService<EthereumWallet>(
          httpClient,
          hdWallet,
        ),
      _ => throw Exception('Unknown coin'),
    };

    address = hdWallet.getAddressForCoin(coin: widget.coinType);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.coinType.description),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FutureBuilder(
                  future: walletService.getBalance(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    final balance = snapshot.data ?? '?';
                    final text = switch (widget.coinType) {
                      const (CoinType.bitcoin) => 'Balance: $balance BTC',
                      const (CoinType.ethereum) => 'Balance: $balance ETH',
                      _ => 'Unknown coin',
                    };

                    return Text(
                      text,
                      style: const TextStyle(fontSize: 24),
                    );
                  },
                ),
                const SizedBox(height: 32),
                const SizedBox(height: 24),
                Text(
                  address,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                if (widget.coinType == CoinType.bitcoin || widget.coinType == CoinType.ethereum) ...[
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => _openTransactionScreen(
                      context,
                      hdWallet,
                      widget.coinType,
                    ),
                    child: const Text('Send'),
                  ),
                ],
              ],
            ),
          ),
        ),
      );

  void _openTransactionScreen(
    BuildContext context,
    HDWallet hdWallet,
    CoinType coinType,
  ) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TransactionScreen(
            hdWallet: hdWallet,
            coinType: coinType,
          ),
        ),
      );
}
