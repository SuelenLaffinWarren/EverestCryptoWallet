// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:everest_card2_listagem/portfolio/provider/isVisible_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/dataSource/crypto_datasource.dart';
import '../../shared/models/crypto_model.dart';
import 'info_title_wallet_column_screen.dart';
import 'row_crypto_list_screen.dart';

class ColumnPrincipalPortfolio extends HookConsumerWidget {
  const ColumnPrincipalPortfolio({
    Key? key,
    required this.isVisibleState,
    // required this.totalAllWallet,
  }) : super(key: key);

  final StateController<bool> isVisibleState;
  //final double totalAllWallet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isVisibleState = ref.watch(stateVisible.state);

    final cryptoList = ref.watch(cryptoListDataSourceProvider);

    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: InfoTitleColumnWallet(),
          ),
          const Divider(
            thickness: 1,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cryptoList.length,
              itemBuilder: (context, index) {
                CryptoModel crypto = cryptoList[index];
                return RowCryptoScreen(
                  cryptoModel: crypto,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
