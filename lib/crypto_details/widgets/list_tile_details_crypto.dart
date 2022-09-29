import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../portfolio/model/crypto_view_data.dart';

class ListTileDetailsCrypto extends StatelessWidget {
  const ListTileDetailsCrypto({
    Key? key,
    required this.isVisibleState,
    required this.crypto,
  }) : super(key: key);

  final StateController<bool> isVisibleState;
  final CryptoViewData crypto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
                          color: crypto.price_change_percentage_24h < 0
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
                      '${crypto.current_price.toDouble()} ${crypto.symbol.toUpperCase()}',
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
    );
  }
}
