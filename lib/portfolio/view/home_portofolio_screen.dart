import 'package:everest_card2_listagem/portfolio/widgtes/column_principal_portfolio.dart';
import 'package:everest_card2_listagem/shared/provider/crypto_provider.dart';
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
    var totalAllWallet = ref.watch(totalAllWalletProvider.state);

    return Scaffold(
      body: ListViewPrincipalPortfolio(
        isVisibleState: isVisibleState,
      ),
      bottomNavigationBar: const BottomNavigationWallet(
        selectedIndex: 0,
      ),
    );
  }
}
