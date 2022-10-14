import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/revision/view/revision_screen.dart';
import 'package:everest_card2_listagem/shared/utils/arguments.dart';
import '../provider/conversion_provider.dart';
import '../../portfolio/model/crypto_view_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomSheetConversion extends StatefulHookConsumerWidget {
  BottomSheetConversion({
    Key? key,
    required this.crypto,
    required this.userValue,
  }) : super(key: key);

  CryptoViewData crypto;
  Decimal userValue;

  @override
  ConsumerState<BottomSheetConversion> createState() =>
      _BottomSheetConversionState();
}

class _BottomSheetConversionState extends ConsumerState<BottomSheetConversion> {
  @override
  Widget build(BuildContext context) {
    final controllerValue = ref.watch(textFieldControllerProvider.state);
    final secondCrypto = ref.watch(secondSelectedCryptoProvider.state);
    final estimatedTotal = ref.watch(totalEstimatedProvider.state);
    final isButtonSelected = ref.watch(boolConversionProvider.state);

    void _showDialogInvalidValue() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Valor inválido"),
            actions: [
              TextButton(
                child: const Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void _showDialogNullValue() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("O campo de valor está vazio!"),
            actions: [
              TextButton(
                child: const Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    bool validationController() {
      if (controllerValue.state.text != '') {
        if (double.parse(controllerValue.state.text.replaceAll(',', '.')) >
            (widget.userValue.toDouble())) {
          return false;
        } else {
          return true;
        }
      } else {
        return true;
      }
    }

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.6,
      builder: (context, scrollController) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 15,
                  ),
                  child: Text(
                    'Total estimado',
                    style: TextStyle(
                        fontSize: 17, color: Color.fromRGBO(117, 118, 128, 1)),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    validationController()
                        ? '${estimatedTotal.state.toStringAsFixed(2)} ${secondCrypto.state.symbol.toUpperCase()}'
                        : '0.00 ${secondCrypto.state.symbol.toUpperCase()}',
                    style: const TextStyle(fontSize: 19),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: FloatingActionButton(
                backgroundColor:
                    isButtonSelected.state ? Colors.pink : Colors.grey,
                child: const Icon(
                  Icons.arrow_forward_sharp,
                ),
                onPressed: () {
                  setState(() {
                    if (controllerValue.state.text == '') {
                      return _showDialogNullValue();
                    }
                    if (validationController() == false) {
                      return _showDialogInvalidValue();
                    } else {
                      Navigator.of(context).pushNamed(RevisionScreen.route,
                          arguments: Arguments(
                              cryptoData: widget.crypto,
                              userCryptoValue: widget.userValue));
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
