import '../provider/conversion_provider.dart';
import '../widgets/body_convertion.dart';
import '../../portfolio/model/crypto_view_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/provider/crypto_provider.dart';
import '../../shared/utils/arguments.dart';
import '../widgets/app_bar_convertion.dart';
import '../widgets/bottom_sheet_conversion.dart';

class ConversionScreen extends StatefulHookConsumerWidget {
  ConversionScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  Arguments args;
  static const route = '/conversion';

  @override
  ConsumerState<ConversionScreen> createState() => _ConversionBodyState();
}

class _ConversionBodyState extends ConsumerState<ConversionScreen> {
  @override
  Widget build(BuildContext context) {
    double conversionPrice = ref.watch(conversionPriceProvider);
    double estimatedTotal = conversionPrice /
        double.parse(widget.args.cryptoData.current_price.toString());

    final cryptoData = ref.watch(cryptoProvider);

    return cryptoData.when(
      data: (data) {
        List<CryptoViewData> listCrypto = data.cryptoListViewData
            .where((crypto) => crypto.symbol != widget.args.cryptoData.symbol)
            .toList();

        String selectCrypto = listCrypto[0].symbol.toUpperCase();
        return Scaffold(
          appBar: const AppBarConvertion(),
          body: SafeArea(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: BodyConvertion(
                  listCrypto: listCrypto,
                  selectCrypto: selectCrypto,
                  args: widget.args,
                )),
          ),
          bottomSheet: BottomSheetConversion(
            crypto: widget.args.cryptoData,
            userValue: widget.args.userCryptoValue,
            estimatedTotal: estimatedTotal,
            selectCrypto: selectCrypto,
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text('Error'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
