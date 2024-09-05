import 'package:flutter/material.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/feature/coin_list_screen/coin_list_screen.dart';

class MainScreen extends StatefulWidget {
  final HDWallet hdWallet;

  const MainScreen({
    super.key,
    required this.hdWallet,
  });

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  HDWallet get hdWallet => widget.hdWallet;

  @override
  void initState() {
    super.initState();

    _pages = [
      CoinListScreen(hdWallet: hdWallet),
      const Center(child: Text('Search Page', style: TextStyle(fontSize: 24))),
      const Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
    ];
  }

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.currency_bitcoin), label: 'Coins'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      );
}
