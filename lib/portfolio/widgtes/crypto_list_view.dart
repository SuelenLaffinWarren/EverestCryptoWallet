// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/portfolio/provider/isVisible_provider.dart';
import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'crypto_list_tile.dart';

class CryptoListView extends StatefulHookConsumerWidget {
  const CryptoListView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CryptoListView> createState() => CryptoListViewState();
}

class CryptoListViewState extends ConsumerState<CryptoListView> {
  @override
  Widget build(BuildContext context) {
    final cryptoViewData = ref.watch(cryptoListProvider);
    final isVisible = ref.watch(stateVisible.state);

    return cryptoViewData.when(
        data: (data) {
          return Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.cryptoListViewData.length,
              itemBuilder: (context, index) {
                final crypto = data.cryptoListViewData[index];

                return Column(
                  children: [
                    const Divider(
                      thickness: 1,
                    ),
                    Material(
                      child: CryptoListTile(
                        crypto: crypto,
                        isVisible: isVisible,
                        userCryptoValue: Decimal.parse(
                          ref.watch(userTotalProvider)[index].toString(),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => const Center(
              child: Text("Erro"),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
