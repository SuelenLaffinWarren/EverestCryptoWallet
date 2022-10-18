import 'package:everest_card2_listagem/movimentations/model/movimentations_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'row_proof_movimentations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListTileMovimentation extends StatefulHookConsumerWidget {
  ListTileMovimentation({
    Key? key,
    required this.isVisible,
    required this.movimentation,
  }) : super(key: key);

  final StateController<bool> isVisible;
  MovimentationsModel movimentation;
  @override
  ConsumerState<ListTileMovimentation> createState() =>
      _ListTileMovimentationState();
}

class _ListTileMovimentationState extends ConsumerState<ListTileMovimentation> {
  @override
  Widget build(BuildContext context) {
    void _showDialogProof() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            width: 100,
            height: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.proof,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        RowProofMovimentations(
                          label1: AppLocalizations.of(context)!.date,
                          label2: DateFormat(
                                  AppLocalizations.of(context)!.dateFormat)
                              .format(widget.movimentation.dateNow),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        RowProofMovimentations(
                            label1:
                                AppLocalizations.of(context)!.movementQuantity,
                            label2:
                                '${widget.movimentation.controller} ${widget.movimentation.firstSymbol.toUpperCase()}'),
                        const Divider(
                          thickness: 1,
                        ),
                        RowProofMovimentations(
                            label1:
                                AppLocalizations.of(context)!.estimatedTotal,
                            label2:
                                '${widget.movimentation.totalEstimated.toStringAsFixed(3)} ${widget.movimentation.secondCrypto.toUpperCase()}'),
                        const Divider(
                          thickness: 1,
                        ),
                        RowProofMovimentations(
                            label1:
                                AppLocalizations.of(context)!.convertCurrency,
                            label2: NumberFormat.simpleCurrency(
                                    decimalDigits: 3, locale: 'pt-BR')
                                .format(widget.movimentation.convertPrice
                                    .toDouble())),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share_rounded,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.save_alt_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Column(
      children: [
        const Divider(
          thickness: 1,
        ),
        ListTile(
          onTap: () {
            _showDialogProof();
          },
          horizontalTitleGap: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  '${widget.movimentation.controller} ${widget.movimentation.firstSymbol.toUpperCase()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                widget.isVisible.state
                    ? Text(
                        '${widget.movimentation.totalEstimated.toStringAsFixed(3)} ${widget.movimentation.secondCrypto.toUpperCase()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                        ),
                      )
                    : SizedBox(
                        child: Container(
                          width: 110,
                          height: 20,
                          color: Colors.grey.shade200,
                        ),
                      ),
              ],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat("dd/MM/yyyy").format(widget.movimentation.dateNow),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color.fromRGBO(117, 118, 128, 1),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                widget.isVisible.state
                    ? Text(
                        NumberFormat.simpleCurrency(
                                decimalDigits: 3, locale: 'pt-BR')
                            .format(
                                widget.movimentation.convertPrice.toDouble()),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(117, 118, 128, 1),
                        ),
                      )
                    : SizedBox(
                        child: Container(
                          width: 90,
                          height: 17,
                          color: Colors.grey.shade200,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
