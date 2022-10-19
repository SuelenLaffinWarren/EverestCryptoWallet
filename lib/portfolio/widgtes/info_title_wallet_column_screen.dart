// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:decimal/intl.dart';
import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.crypto,
              style: const TextStyle(
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
            ? FutureBuilder(
                future: ref.watch(
                    getTotalProvider(ref.watch(userTotalProvider)).future),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      NumberFormat.simpleCurrency(
                              locale: 'pt-BR', decimalDigits: 2)
                          .format(DecimalIntl(snapshot.data!)),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                }),
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
        Text(
          AppLocalizations.of(context)!.totalCoinValue,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(117, 118, 128, 1),
          ),
        ),
      ],
    );
  }
}
