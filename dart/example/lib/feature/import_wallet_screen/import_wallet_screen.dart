import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trust_wallet_core_example/data/hd_wallet.dart';
import 'package:trust_wallet_core_example/di/dependency_scope.dart';
import 'package:trust_wallet_core_example/feature/main/main_screen.dart';

class ImportWalletScreen extends StatefulWidget {
  const ImportWalletScreen({super.key});

  @override
  State<ImportWalletScreen> createState() => _ImportWalletScreenState();
}

class _ImportWalletScreenState extends State<ImportWalletScreen> {
  var mnemonic = '';
  late final HdWallet _hdWallet;

  @override
  void initState() {
    super.initState();
    _hdWallet = DependencyScope.of(context).hdWallet;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Import Wallet'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your mnemonic',
                ),
                onChanged: (value) {
                  mnemonic = value;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _importWallet,
                child: const Text('Import Wallet'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _createNewWallet,
                child: const Text('Create new wallet'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _importWallet() {
    _hdWallet.createWithMnemonic(mnemonic);

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
  }

  void _createNewWallet() {
    _hdWallet.create();
    final mnemonic = _hdWallet.mnemonic();
    Clipboard.setData(ClipboardData(text: mnemonic));

    //TODO: implement this case
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MnemonicScreen(mnemonic: mnemonic)));
  }
}
