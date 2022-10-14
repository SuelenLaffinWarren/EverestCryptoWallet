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
    required this.hintText,
    required this.args,
    required this.onChange,
  }) : super(key: key);

  Arguments args;

  final void Function(String) onChange;

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
    final controllerValue = ref.watch(textFieldControllerProvider.state);
    Arguments args = widget.args;
    CryptoViewData cryptoViewData = ref.watch(cryptoModelProvider);

    return Column(
      children: [
        TextFormField(
          controller: controllerValue.state,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Digite um valor válido';
            }
            return null;
          },
          onChanged: widget.onChange,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\,?\d{0,6}')),
          ],
          decoration: InputDecoration(
              hintText: '0,00',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 5, right: 10),
                child: Text(
                  widget.args.cryptoData.symbol.toUpperCase(),
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              hintStyle: const TextStyle(fontSize: 31),
              helperStyle: const TextStyle(
                  fontSize: 17, color: Color.fromRGBO(117, 118, 128, 1))),
        ),
      ],
    );
  }
}
