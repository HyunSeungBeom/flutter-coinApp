import 'package:flutter/material.dart';
import '../services/api.dart';
import '../types/coins.dart';

class CoinListPage extends StatefulWidget {
  const CoinListPage({Key? key}) : super(key: key);

  @override
  CoinListPageState createState() => CoinListPageState();
}

class CoinListPageState extends State<CoinListPage> {
  List<Coin> coins = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final coinData = await API.getCoins();
      setState(() {
        coins = coinData;
      });
    } catch (e) {
      print('오류 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('코인 리스트'),
      ),
      body: ListView.builder(
        itemCount: coins.length,
        itemBuilder: (context, index) {
          final coin = coins[index];
          return ListTile(
            title: Text(coin.name),
            subtitle: Text('가격: \$${coin.currentPrice}'),
          );
        },
      ),
    );
  }
}
