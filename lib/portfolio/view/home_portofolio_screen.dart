import 'package:everest_card2_listagem/portfolio/widgtes/listView_principal_portofolio.dart';
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
  //var totalCrypto = btcValue + ethValue + ltcValue;
  var selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(stateVisible.state);

    return Scaffold(
      body: ListViewPrincipalPortfolio(
        isVisibleState: isVisibleState,
        totalCrypto: totalCrypto,
      ),
      bottomNavigationBar: const BottomNavigationWallet(
        selectedIndex: 0,
      ),
    );
  }
}
