// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_card2_listagem/movimentations/view/movimentations_screen.dart';

import '../../shared/bottom_navigation/bottom_navigation_page.dart';
import '../widgtes/column_principal_portofolio.dart';
import '../provider/providers.dart';

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
  void _onItemTapped(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

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
      bottomNavigationBar: BottomNavigationWallet(
        selectedIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
