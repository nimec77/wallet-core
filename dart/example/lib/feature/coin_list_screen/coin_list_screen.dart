import 'package:flutter/material.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/common/widgets/highlighted_text.dart';
import 'package:trust_wallet_core_example/feature/coin_detail_screen/coin_detail_screen.dart';

class CoinListScreen extends StatefulWidget {
  final HDWallet hdWallet;

  const CoinListScreen({
    super.key,
    required this.hdWallet,
  });

  @override
  State<CoinListScreen> createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {
  final _searchController = TextEditingController();
  final _coins = <CoinType>[];

  @override
  void initState() {
    super.initState();

    _coins.addAll(CoinType.values);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Currencies'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onEditingComplete: _onSearch,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _onSearch,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _coins.isEmpty
                  ? const Center(
                      child: Text('No results'),
                    )
                  : ListView.builder(
                      itemCount: _coins.length,
                      itemBuilder: (context, index) {
                        final coinType = _coins[index];
                        return ListTile(
                          title: HighlightedText(
                            coinType.description,
                            subText: _searchController.text,
                          ),
                          subtitle: HighlightedText(
                            coinType.ticker,
                            subText: _searchController.text,
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CoinDetailScreen(
                                hdWallet: widget.hdWallet,
                                coinType: coinType,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      );

  void _onSearch() {
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      _coins.clear();

      final query = _searchController.text.toLowerCase();

      for (final coin in CoinType.values) {
        if (coin.description.toLowerCase().contains(query) || coin.ticker.toLowerCase().contains(query)) {
          _coins.add(coin);
        }
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }
}
