import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/portfolio/widgtes/column_principal_portofolio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/bottom_navigation/bottom_navigation_page.dart';
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
  var selectedPage = 0;

  // PageController controller = PageController();

  // @override
  // void initState() {
  //   super.initState();
  //   controller = PageController(initialPage: selectedPage);
  // }

  // setCurrentPage(page) {
  //   setState(() {
  //     selectedPage = page;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(visibilityProvider.state);

    return Scaffold(
      body: ColumnPortfolio(
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
      bottomNavigationBar: const BottomNavigationWallet(
        selectedIndex: 0,
      ),
    );
  }
}
