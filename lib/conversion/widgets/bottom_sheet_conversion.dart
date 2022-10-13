import 'package:decimal/decimal.dart';
import '../provider/conversion_provider.dart';
import '../../portfolio/model/crypto_view_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomSheetConversion extends StatefulHookConsumerWidget {
  BottomSheetConversion({
    Key? key,
    required this.crypto,
    required this.userValue,
    required this.estimatedTotal,
    required this.selectCrypto,
  }) : super(key: key);

  CryptoViewData crypto;
  Decimal userValue;
  double estimatedTotal;
  String selectCrypto;
  @override
  ConsumerState<BottomSheetConversion> createState() =>
      _BottomSheetConversionState();
}

class _BottomSheetConversionState extends ConsumerState<BottomSheetConversion> {
  @override
  Widget build(BuildContext context) {
    bool boolConversion = ref.watch(boolConversionProvider);
    double conversionPrice = ref.watch(conversionPriceProvider);

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
                Text(
                  conversionPrice != 0
                      ? '${widget.estimatedTotal.toStringAsFixed(3)} ${widget.selectCrypto.toUpperCase()}'
                      : '0.000 ${widget.selectCrypto.toUpperCase()}',
                  style: const TextStyle(fontSize: 19),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: FloatingActionButton(
                backgroundColor: boolConversion ? Colors.pink : Colors.grey,
                child: const Icon(
                  Icons.arrow_forward_sharp,
                ),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
