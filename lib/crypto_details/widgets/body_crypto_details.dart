// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:everest_card2_listagem/conversion/view/conversion_screen.dart';
import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../../portfolio/provider/isVisible_provider.dart';
import '../../shared/utils/arguments.dart';
import '../providers_details/providers_details.dart';
import 'graphic_details_screen.dart';
import 'row_buttons_graphic_days.dart';

class BodyCryptoDetails extends StatefulHookConsumerWidget {
  BodyCryptoDetails({Key? key, required this.crypto, required this.userValue})
      : super(key: key);
  CryptoViewData crypto;
  Decimal userValue;

  @override
  ConsumerState<BodyCryptoDetails> createState() => _BodyCryptoDetailsState();
}

class _BodyCryptoDetailsState extends ConsumerState<BodyCryptoDetails> {
  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(stateVisible.state);
    final listMarkerData =
        ref.watch(marketGraphicDataProvider(widget.crypto.name));
    final priceCurrentGraphic = ref.watch(currentPriceGraphicProvider.state);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 20, left: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.crypto.name,
                      style: const TextStyle(
                          fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.crypto.symbol.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(117, 118, 128, 1)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: Image.network(
                    widget.crypto.image,
                    width: 48,
                    height: 48,
                  ),
                ),
              ],
            ),
          ),
          isVisibleState.state
              ? Padding(
                  padding: const EdgeInsets.only(left: 17, top: 10),
                  child: Text(
                    NumberFormat.simpleCurrency(
                            locale: 'pt-BR', decimalDigits: 2)
                        .format(DecimalIntl(priceCurrentGraphic.state)),
                    style: const TextStyle(
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Container(
                    width: 250,
                    height: 45,
                    color: Colors.grey.shade200,
                  ),
                ),
          listMarkerData.when(
              data: (data) => GraphicDetailsScreen(
                    crypto: widget.crypto,
                    listMarketData: data,
                  ),
              error: (error, stackTrace) => Center(
                    child: Text('$error'),
                  ),
              loading: () => const CircularProgressIndicator()),
          const Divider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: RowButtonsGraphicDays(),
          ),
          Column(
            children: [
              const Divider(
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
              ListTile(
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Preço atual',
                          style: TextStyle(
                              color: Color.fromRGBO(117, 118, 128, 1),
                              fontSize: 19,
                              fontWeight: FontWeight.w400),
                        ),
                        isVisibleState.state
                            ? Text(
                                NumberFormat.simpleCurrency(
                                        locale: 'pt-BR', decimalDigits: 2)
                                    .format(DecimalIntl(
                                        widget.crypto.current_price)),
                                style: const TextStyle(
                                    color: Color.fromRGBO(47, 47, 51, 1),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400),
                              )
                            : Container(
                                width: 80,
                                height: 20,
                                color: Colors.grey.shade200,
                              ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Variação 24H',
                          style: TextStyle(
                              color: Color.fromRGBO(117, 118, 128, 1),
                              fontSize: 19,
                              fontWeight: FontWeight.w400),
                        ),
                        isVisibleState.state
                            ? Text(
                                '${widget.crypto.price_change_percentage_24h > 0 ? '+' : ''}${widget.crypto.price_change_percentage_24h.toStringAsFixed(2)}%',
                                style: TextStyle(
                                    color: widget.crypto
                                                .price_change_percentage_24h <
                                            0
                                        ? Colors.red
                                        : Colors.green,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400),
                              )
                            : Container(
                                width: 80,
                                height: 20,
                                color: Colors.grey.shade200,
                              ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Quantidade',
                          style: TextStyle(
                              color: Color.fromRGBO(117, 118, 128, 1),
                              fontSize: 19,
                              fontWeight: FontWeight.w400),
                        ),
                        isVisibleState.state
                            ? Text(
                                '${widget.userValue} ${widget.crypto.symbol.toUpperCase()}',
                                style: const TextStyle(
                                    color: Color.fromRGBO(47, 47, 51, 1),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400),
                              )
                            : Container(
                                width: 80,
                                height: 20,
                                color: Colors.grey.shade200,
                              ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Valor',
                          style: TextStyle(
                              color: Color.fromRGBO(117, 118, 128, 1),
                              fontSize: 19,
                              fontWeight: FontWeight.w400),
                        ),
                        isVisibleState.state
                            ? Text(
                                NumberFormat.simpleCurrency(
                                        locale: 'pt-BR', decimalDigits: 2)
                                    .format(DecimalIntl(
                                        widget.crypto.current_price *
                                            widget.userValue)),
                                style: const TextStyle(
                                    color: Color.fromRGBO(47, 47, 51, 1),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400),
                              )
                            : Container(
                                width: 80,
                                height: 20,
                                color: Colors.grey.shade200,
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 343,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              ConversionScreen.route,
                              arguments: Arguments(
                                  cryptoData: widget.crypto,
                                  userCryptoValue: widget.userValue));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(224, 43, 87, 1),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Converter moeda',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
