// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:brasil_fields/brasil_fields.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';
import 'package:intl/intl.dart';

import '../../portfolio/provider/isVisible_provider.dart';
import '../../portfolio/model/crypto_view_data.dart';
import '../providers_details/providers_details.dart';
import 'graphic_details_screen.dart';
import 'row_buttons_graphic_days.dart';

class BodyCryptoDetails extends HookConsumerWidget {
  const BodyCryptoDetails({
    Key? key,
    required this.crypto,
  }) : super(key: key);
  final CryptoViewData crypto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isVisibleState = ref.watch(stateVisible.state);
    final listMarkerData = ref.watch(marketGraphicDataProvider(crypto.name));
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
                      crypto.name,
                      style: const TextStyle(
                          fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      crypto.symbol.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(117, 118, 128, 1)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: Image.network(
                    crypto.image,
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
                    UtilBrasilFields.obterReal(crypto.current_price.toDouble()),
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
                    crypto: crypto,
                    listmarketData: data,
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
                    const SizedBox(
                      height: 10,
                    ),
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
                                    .format(DecimalIntl(crypto.current_price)),
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
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
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
                                '${crypto.price_change_percentage_24h > 0 ? '+' : ''}${crypto.price_change_percentage_24h.toStringAsFixed(2)}%',
                                style: TextStyle(
                                    color:
                                        crypto.price_change_percentage_24h < 0
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
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
                                '${crypto.current_price} ${crypto.symbol.toUpperCase()}',
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
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
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
                                    .format(DecimalIntl(crypto.current_price)),
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
                        onPressed: () {},
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
