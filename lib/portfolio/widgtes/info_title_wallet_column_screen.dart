// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/shared/dataSource/crypto_datasource.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_card2_listagem/shared/provider/crypto_provider.dart';

import '../provider/isVisible_provider.dart';

class InfoTitleColumnWallet extends StatefulHookConsumerWidget {
  const InfoTitleColumnWallet({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<InfoTitleColumnWallet> createState() =>
      _InfoTitleColumnWalletState();
}

class _InfoTitleColumnWalletState extends ConsumerState<InfoTitleColumnWallet> {
  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(stateVisible.state);
    final cryptoList = ref.read(cryptoListDataSourceProvider);

    Decimal totalAllWallet() {
      Decimal totalAllWallet = Decimal.parse('0');
      for (int index = 0; index < cryptoList.length; index++) {
        totalAllWallet += cryptoList[index].totalAllWallet;
      }
      return totalAllWallet;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cripto',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(224, 43, 87, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: IconButton(
                icon: Icon(isVisibleState.state
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () => setState(
                  (() => isVisibleState.state = !isVisibleState.state),
                ),
              ),
            ),
          ],
        ),
        isVisibleState.state
            ? Text(
                FormatValueNumber.format(totalAllWallet()),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              )
            : SizedBox(
                child: Container(
                  width: 195,
                  height: 40,
                  color: Colors.grey.shade200,
                ),
              ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Valor total de moedas',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(117, 118, 128, 1),
          ),
        ),
      ],
    );
  }
}
