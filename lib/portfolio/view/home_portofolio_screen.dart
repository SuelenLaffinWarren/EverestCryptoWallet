import '../widgtes/info_title_wallet_column_screen.dart';

import '../widgtes/crypto_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/bottom_navigation/bottom_navigation_page.dart';

class HomePortfolioScreen extends StatefulHookConsumerWidget {
  static const route = '/portfolio';
  const HomePortfolioScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomePortfolioScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<HomePortfolioScreen> {
  var selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: InfoTitleColumnWallet(),
            ),
            Expanded(child: CryptoListView()),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationWallet(
        selectedIndex: 0,
      ),
    );
  }
}
