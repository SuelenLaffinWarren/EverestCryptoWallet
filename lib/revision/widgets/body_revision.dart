import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/utils/arguments.dart';
import 'revision_button.dart';
import 'row_revision.dart';

class BodyRevision extends StatelessWidget {
  const BodyRevision({
    Key? key,
    required this.controller,
    required this.totalEstimated,
    required this.secondCrypto,
    required this.args,
  }) : super(key: key);

  final StateController<TextEditingController> controller;
  final Arguments args;
  final StateController<double> totalEstimated;
  final StateController<CryptoViewData> secondCrypto;

  @override
  Widget build(BuildContext context) {
    double getCambio() {
      final cambio =
          args.cryptoData.current_price / secondCrypto.state.current_price;
      return cambio.toDouble();
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, right: 30),
          child: Text(
            AppLocalizations.of(context)!.reviewQuestion,
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 200,
        ),
        const Divider(
          thickness: 1,
          height: 25,
        ),
        RowRevision(
            label: AppLocalizations.of(context)!.toConvert,
            value:
                '${controller.state.text} ${args.cryptoData.symbol.toUpperCase()}'),
        const Divider(
          thickness: 1,
          height: 25,
        ),
        RowRevision(
            label: AppLocalizations.of(context)!.toReceive,
            value:
                '${totalEstimated.state.toStringAsFixed(4)} ${secondCrypto.state.symbol.toUpperCase()}'),
        const Divider(
          thickness: 1,
          height: 25,
        ),
        RowRevision(
          label: AppLocalizations.of(context)!.exchange,
          value:
              ' 1 ${args.cryptoData.symbol.toUpperCase()} = ${getCambio().toStringAsFixed(4)}  ${secondCrypto.state.symbol.toUpperCase()}',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SizedBox(
            width: 343,
            height: 56,
            child: RevisionButton(
              secondCrypto: secondCrypto,
              totalEstimated: totalEstimated,
              args: args,
            ),
          ),
        ),
      ],
    );
  }
}
