import 'package:decimal/decimal.dart';

import '../../l10n/app_localizations.dart';
import '../provider/conversion_provider.dart';
import 'row_convert_buttons.dart';
import 'text_field_conversion.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/utils/arguments.dart';
import 'package:intl/intl.dart';

class BodyConvertion extends StatefulHookConsumerWidget {
  BodyConvertion({
    Key? key,
    required this.args,
  }) : super(key: key);

  Arguments args;

  @override
  ConsumerState<BodyConvertion> createState() => _BodyConvertionState();
}

class _BodyConvertionState extends ConsumerState<BodyConvertion> {
  @override
  Widget build(BuildContext context) {
    final secondCrypto = ref.watch(secondSelectedCryptoProvider.state);
    final controllerValue = ref.watch(textFieldControllerProvider.state);
    final convertPrice = ref.watch(conversionPriceProvider.state);
    final totalEstimated = ref.watch(totalEstimatedProvider.state);

    Decimal getConverterValue() {
      if (controllerValue.state.text != '') {
        return convertPrice.state =
            Decimal.parse(controllerValue.state.text.replaceAll(',', '.')) *
                Decimal.parse(widget.args.cryptoData.current_price.toString());
      } else {
        convertPrice.state = Decimal.parse('0');
      }
      return convertPrice.state;
    }

    double getTotalEstimated() {
      totalEstimated.state = convertPrice.state.toDouble() /
          secondCrypto.state.current_price.toDouble();

      return totalEstimated.state;
    }

    bool valueIsPossible() {
      if (controllerValue.state.text != '') {
        if (double.parse(controllerValue.state.text.replaceAll(',', '.')) <=
            (widget.args.userCryptoValue.toDouble())) {
          return true;
        } else {
          return false;
        }
      }
      return true;
    }

    buttonBottomSheet() {
      if (controllerValue.state.text != '') {
        if (valueIsPossible()) {
          ref.read(boolConversionProvider.state).state = true;
        } else {
          ref.read(boolConversionProvider.state).state = false;
        }
      } else {
        ref.read(boolConversionProvider.state).state = false;
      }
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 49,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 13,
                right: 13,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.balanceAvailable,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                      '${widget.args.userCryptoValue} ${widget.args.cryptoData.symbol.toUpperCase()}'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 20, bottom: 15),
            child: Text(
              AppLocalizations.of(context)!.howLikeConvert,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w700),
            ),
          ),
          RowConvertButtons(
            symbol: widget.args.cryptoData.symbol,
            image: widget.args.cryptoData.image,
            cryptoViewData: secondCrypto.state,
            onChange: (CryptoViewData? selectedCrypto) {
              secondCrypto.state = selectedCrypto!;
              getConverterValue();
              getTotalEstimated();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 20, top: 18),
            child: TextFieldConversion(
              hintText: '${widget.args.cryptoData.symbol.toUpperCase()} 0.00',
              args: widget.args,
              onChange: (value) {
                getConverterValue();
                getTotalEstimated();
                buttonBottomSheet();
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                  valueIsPossible()
                      ? NumberFormat.simpleCurrency(
                              locale: 'pt-BR', decimalDigits: 2, name: "R\$")
                          .format(double.parse(convertPrice.state.toString()))
                      : AppLocalizations.of(context)!.balanceUnavailable,
                  style: TextStyle(
                      fontSize: 15,
                      color: valueIsPossible()
                          ? Colors.grey.shade600
                          : Colors.red))),
        ],
      ),
    );
  }
}
