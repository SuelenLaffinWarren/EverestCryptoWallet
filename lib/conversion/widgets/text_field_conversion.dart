import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';
import '../provider/conversion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/arguments.dart';

class TextFieldConversion extends StatefulHookConsumerWidget {
  TextFieldConversion({
    Key? key,
    required this.symbol,
    required this.hintText,
    required this.args,
    required this.listCrypto,
  }) : super(key: key);

  final String symbol;
  Arguments args;
  List<CryptoViewData> listCrypto;

  final String hintText;

  @override
  ConsumerState<TextFieldConversion> createState() =>
      _TextFieldConversionState();
}

bool moneyHelperText = true;
double changeMoney = 0;

class _TextFieldConversionState extends ConsumerState<TextFieldConversion> {
  @override
  Widget build(BuildContext context) {
    Arguments args = widget.args;
    CryptoViewData cryptoViewData = ref.watch(cryptoModelProvider);
    void getConvertValue(double conversionPrice, bool boolConvertion) {
      ref.read(conversionPriceProvider.notifier).state = conversionPrice;
      ref.read(boolConversionProvider.notifier).state = boolConvertion;
      moneyHelperText = boolConvertion;
    }

    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Digite um valor válido';
            }
            return null;
          },
          onTap: () {
            if (cryptoViewData.symbol == '') {
              ref.read(cryptoModelProvider.notifier).state =
                  widget.listCrypto[0];
            }
          },
          onChanged: (value) {
            if (value != '') {
              Decimal valueDecimal =
                  Decimal.parse(value.replaceAll(RegExp(r','), '.'));
              changeMoney = valueDecimal.toDouble() *
                  widget.args.cryptoData.current_price.toDouble();

              getConvertValue(changeMoney, true);

              if (valueDecimal > args.userCryptoValue) {
                getConvertValue(0, false);
              }
              if (valueDecimal.toDouble() == 0) {
                ref.read(boolConversionProvider.notifier).state = false;
              }
            }

            setState(() {});
          },
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\,?\d{0,6}')),
          ],
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(fontSize: 31),
              helperStyle: const TextStyle(
                  fontSize: 17, color: Color.fromRGBO(117, 118, 128, 1))),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            moneyHelperText
                ? 'R\$ ${Decimal.parse(changeMoney.toString()).toStringAsFixed(2)}'
                : 'Saldo indisponível',
            style: TextStyle(
                fontSize: 18,
                color: moneyHelperText ? Colors.grey.shade600 : Colors.red),
          ),
        ),
      ],
    );
  }
}
