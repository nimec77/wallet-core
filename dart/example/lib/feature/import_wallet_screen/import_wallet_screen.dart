import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart' show HDWallet, Mnemonic;
import 'package:trust_wallet_core_example/feature/main/main_screen.dart';
import 'package:trust_wallet_core_example/feature/mnemonic_screen/mnemonic_screen.dart';

class ImportWalletScreen extends StatefulWidget {
  const ImportWalletScreen({super.key});

  @override
  State<ImportWalletScreen> createState() => _ImportWalletScreenState();
}

class _ImportWalletScreenState extends State<ImportWalletScreen> {
  String mnemonic = '';

  @override
  Widget build(BuildContext context) => Scaffold(
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
                  onChanged: (value) => mnemonic = value,
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

  void _importWallet({
    String passphrase = '',
  }) {
    if (!Mnemonic.isValid(mnemonic)) throw Exception(["mnemonic is invalid"]);

    final hdWallet = HDWallet.createWithMnemonic(mnemonic, passphrase);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => MainScreen(
          hdWallet: hdWallet,
        ),
      ),
    );
  }

  void _createNewWallet({
    int strength = 128,
    String passphrase = '',
  }) {
    assert(strength >= 128 && strength <= 256 && strength % 32 == 0);
    final hdWallet = HDWallet.create(strength, passphrase);
    setState(() {
      mnemonic = hdWallet.mnemonic;
    });

    Clipboard.setData(ClipboardData(text: mnemonic));

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => MnemonicScreen(
          mnemonic: mnemonic,
          hdWallet: hdWallet,
        ),
      ),
    );
  }
}
