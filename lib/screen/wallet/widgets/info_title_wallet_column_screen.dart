import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/provider/providers.dart';

class InfoTitleColumnWallet extends StatefulHookConsumerWidget {
  const InfoTitleColumnWallet({
    Key? key,
    required this.isVisibleState,
    required this.totalCrypto,
  }) : super(key: key);

  final bool isVisibleState;
  final Decimal totalCrypto;

  @override
  ConsumerState<InfoTitleColumnWallet> createState() =>
      _InfoTitleColumnWalletState();
}

class _InfoTitleColumnWalletState extends ConsumerState<InfoTitleColumnWallet> {
  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(visibilityProvider.state);

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
                NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
                    .format(
                  DecimalIntl(widget.totalCrypto),
                ),
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
