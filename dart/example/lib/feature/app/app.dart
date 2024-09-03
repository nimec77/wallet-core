import 'package:flutter/material.dart';
import 'package:trust_wallet_core_example/feature/import_wallet_screen/import_wallet_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Wallet application',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ImportWalletScreen(),
      );
}
