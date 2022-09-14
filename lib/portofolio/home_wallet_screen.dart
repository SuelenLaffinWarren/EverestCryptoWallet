// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'provider/providers.dart';
import '../bottom_navigation_bar/bottom_navigation_bar_wallet_screen.dart';
import 'widgtes/portofolio_screen.dart';

class WalletScreen extends StatefulHookConsumerWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
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

  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(visibilityProvider.state);

    return Scaffold(
      body: SafeArea(
        child: PortfolioScreen(
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
      ),
      bottomNavigationBar: const BottomNavigationBarWalletCrypto(),
    );
  }
}
