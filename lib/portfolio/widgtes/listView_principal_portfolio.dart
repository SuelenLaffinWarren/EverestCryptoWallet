import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/portfolio/provider/providers.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dataSource/crypto_datasource.dart';
import 'info_title_wallet_column_screen.dart';
import 'row_crypto_screen.dart';

class ListViewPrincipalPortfolio extends StatefulHookConsumerWidget {
  const ListViewPrincipalPortfolio({
    Key? key,
    required this.isVisibleState,
    required this.totalCrypto,
  }) : super(key: key);

  final StateController<bool> isVisibleState;
  final Decimal totalCrypto;

  @override
  ConsumerState<ListViewPrincipalPortfolio> createState() =>
      _PortfolioScreenState();
}

class _PortfolioScreenState extends ConsumerState<ListViewPrincipalPortfolio> {
  final getAllCrypto = CryptoDatasource();
  @override
  Widget build(BuildContext context) {
    // void onTapBitcoin() {
    //   Navigator.of(context).pushNamed('/bitcoin_details_screen');
    // }

    // void onTapLtc() {
    //   Navigator.of(context).pushNamed('/ltc_details_screen');
    // }

    // void onTapEth() {
    //   Navigator.of(context).pushNamed('/eth_details_screen');
    // }

    var isVisibleState = ref.watch(stateVisible.state);
    final cryptoList = getAllCrypto.getAllCrypto();

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: InfoTitleColumnWallet(
                isVisibleState: widget.isVisibleState.state,
                totalCrypto: widget.totalCrypto),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cryptoList.length,
              itemBuilder: (context, index) {
                return RowCryptoScreen(
                  cryptoModel: cryptoList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
