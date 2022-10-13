import 'row_convert_buttons.dart';
import 'text_field_conversion.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/utils/arguments.dart';

class BodyConvertion extends StatefulHookConsumerWidget {
  BodyConvertion({
    Key? key,
    required this.listCrypto,
    required this.selectCrypto,
    required this.args,
  }) : super(key: key);

  final List<CryptoViewData> listCrypto;
  final String selectCrypto;
  Arguments args;

  @override
  ConsumerState<BodyConvertion> createState() => _BodyConvertionState();
}

class _BodyConvertionState extends ConsumerState<BodyConvertion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 49,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Saldo disponível',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                    '${widget.args.userCryptoValue} ${widget.args.cryptoData.symbol.toUpperCase()}'),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 13, top: 10),
          child: Text(
            'Quanto você gostaria de \n converter?',
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RowConvertButtons(
          symbol: widget.args.cryptoData.symbol,
          image: widget.args.cryptoData.image,
          listCrypto: widget.listCrypto,
          selectCrypto: widget.selectCrypto,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13, right: 20, top: 18),
          child: TextFieldConversion(
            symbol: widget.args.cryptoData.symbol,
            hintText: '${widget.args.cryptoData.symbol.toUpperCase()} 0.00',
            args: widget.args,
            listCrypto: widget.listCrypto,
          ),
        ),
        const SizedBox(
          height: 150,
        ),
      ],
    );
  }
}
