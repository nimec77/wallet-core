import 'package:flutter/material.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/feature/main/main_screen.dart';

class MnemonicScreen extends StatelessWidget {
  final HDWallet hdWallet;
  final String mnemonic;

  const MnemonicScreen({
    super.key,
    required this.hdWallet,
    required this.mnemonic,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Mnemonic'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mnemonic,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _next(context),
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      );

  void _next(BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => MainScreen(
            hdWallet: hdWallet,
          ),
        ),
      );
}
