import 'package:everest_card2_listagem/portfolio/widgtes/info_title_wallet_column_screen.dart';

import '../../shared/total_wallet_model/total_wallet_model.dart';
import '../widgtes/crypto_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/bottom_navigation/bottom_navigation_page.dart';

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
    List<TotalWalletModel> totalWalletCrypto = [];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InfoTitleColumnWallet(totalWalletModel: totalWalletCrypto),
            ),
            const HomePortfolioColumn(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationWallet(
        selectedIndex: 0,
      ),
    );
  }
}
