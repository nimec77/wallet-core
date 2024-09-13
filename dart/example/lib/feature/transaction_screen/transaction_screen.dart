import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/data/factory/wallet_service_factory.dart';
import 'package:trust_wallet_core_example/data/services/wallet_service.dart';
import 'package:trust_wallet_core_example/data/wallets/bitcoin_wallet.dart';
import 'package:trust_wallet_core_example/data/wallets/ethereum_wallet.dart';
import 'package:trust_wallet_core_example/di/dependency_scope.dart';

enum LoadingStatus {
  idle,
  loading,
}

class TransactionScreen extends StatefulWidget {
  final HDWallet hdWallet;
  final CoinType coinType;

  const TransactionScreen({
    super.key,
    required this.hdWallet,
    required this.coinType,
  });

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  LoadingStatus status = LoadingStatus.idle;
  String amount = '';
  late final WalletService _walletService;
  final _recipientAddressController = TextEditingController();

  HDWallet get _hdWallet => widget.hdWallet;
  CoinType get _coinType => widget.coinType;

  @override
  void initState() {
    super.initState();

    final httpClient = DependencyScope.of(context).http;

    _walletService = switch (_coinType) {
      CoinType.bitcoin => WalletServiceFactory.getService<BitcoinWallet>(
          httpClient,
          _hdWallet,
        ),
      CoinType.ethereum => WalletServiceFactory.getService<EthereumWallet>(
          httpClient,
          _hdWallet,
        ),
      _ => throw UnimplementedError(),
    };
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Send transaction'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _recipientAddressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the recipient address',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter amount',
                  ),
                  onChanged: (value) {
                    amount = value;
                  },
                ),
                const SizedBox(height: 16),
                status == LoadingStatus.idle
                    ? ElevatedButton(
                        onPressed: _sendBitcoinTransaction,
                        child: const Text('Send'),
                      )
                    : const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      );

  void _sendBitcoinTransaction() async {
    final toAddress = _recipientAddressController.text;
    if (toAddress.isEmpty || amount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
      return;
    }

    setState(() {
      status = LoadingStatus.loading;
    });

    late final String result;

    try {
      result = await _walletService.sendTransaction(
        toAddress: toAddress,
        amount: amount,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
      return;
    } finally {
      setState(() {
        status = LoadingStatus.idle;
      });
    }

    if (mounted) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Transaction result'),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: result));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Transaction hash copied to clipboard'),
                  ),
                );
              },
              child: const Text('COPY'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _recipientAddressController.dispose();

    super.dispose();
  }
}
