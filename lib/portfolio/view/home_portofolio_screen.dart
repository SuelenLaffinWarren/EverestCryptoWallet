import '../widgtes/column_principal_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/bottom_navigation/bottom_navigation_page.dart';
import '../../shared/provider/crypto_provider.dart';
import '../provider/isVisible_provider.dart';

class HomePortfolioScreen extends StatefulHookConsumerWidget {
  static const route = '/portfolio';
  const HomePortfolioScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePortfolioScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<HomePortfolioScreen> {
  var selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(stateVisible.state);
    final cryptoModel = ref.watch(cryptoModelProvider);

    return Scaffold(
      body: ColumnPrincipalPortfolio(
        isVisibleState: isVisibleState,
      ),
      bottomNavigationBar: const BottomNavigationWallet(
        selectedIndex: 0,
      ),
    );
  }
}
