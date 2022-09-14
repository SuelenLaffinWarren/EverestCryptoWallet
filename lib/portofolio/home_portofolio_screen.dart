import 'package:decimal/decimal.dart';

import 'package:everest_card2_listagem/movimentations/movimentations_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'column_principal_portofolio.dart';
import 'provider/providers.dart';

class HomePortofolioScreen extends StatefulHookConsumerWidget {
  const HomePortofolioScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePortofolioScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<HomePortofolioScreen> {
  double quantityBtc = 0.65;
  double quantityEth = 0.94;
  double quantityLtc = 0.82;

  String abrvBtc = 'BTC';
  String abrvEth = 'ETH';
  String abrvLtc = 'LTC';

  static var btcValue = Decimal.parse('6557.00');
  static var ethValue = Decimal.parse('7996.00');
  static var ltcValue = Decimal.parse('245.00');

  var totalCrypto = btcValue + ethValue + ltcValue;
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(visibilityProvider.state);

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          ColumnPortofolio(
              isVisibleState: isVisibleState,
              totalCrypto: totalCrypto,
              btcValue: btcValue,
              quantityBtc: quantityBtc,
              abrvBtc: abrvBtc,
              ethValue: ethValue,
              quantityEth: quantityEth,
              abrvEth: abrvEth,
              ltcValue: ltcValue,
              quantityLtc: quantityLtc,
              abrvLtc: abrvLtc),
          const MovimentationsScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Warren_False.png'),
            activeIcon: Image.asset('assets/images/warrenTrue.png'),
            label: 'Portfólio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/crypto_false.png'),
            activeIcon: Image.asset('assets/images/Crypto_True.png'),
            label: 'Movimentações',
          ),
        ],
        selectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
