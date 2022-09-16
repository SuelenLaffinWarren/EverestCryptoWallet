// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:everest_card2_listagem/shared/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_card2_listagem/portfolio/provider/providers.dart';

import '../../dataSource/crypto_datasource.dart';
import 'info_title_wallet_column_screen.dart';
import 'row_crypto_screen.dart';

class ListViewPrincipalPortfolio extends StatefulHookConsumerWidget {
  const ListViewPrincipalPortfolio({
    Key? key,
    required this.isVisibleState,
    // required this.totalAllWallet,
  }) : super(key: key);

  final StateController<bool> isVisibleState;
  //final double totalAllWallet;

  @override
  ConsumerState<ListViewPrincipalPortfolio> createState() =>
      _PortfolioScreenState();
}

class _PortfolioScreenState extends ConsumerState<ListViewPrincipalPortfolio> {
  final getAllCrypto = CryptoDatasource();
  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(stateVisible.state);
    var allWalletState = ref.watch(totalAllWalletProvider.state);
    final cryptoList = getAllCrypto.getAllCrypto();

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: InfoTitleColumnWallet(
              isVisibleState: isVisibleState.state,
            ),
          ),
          const Divider(
            thickness: 1,
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
