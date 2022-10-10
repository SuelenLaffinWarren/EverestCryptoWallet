import '../widgets/body_convertion.dart';
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
    final cryptoData = ref.watch(cryptoListProvider);

    return cryptoData.when(
      data: (data) {
        return Scaffold(
          appBar: const AppBarConvertion(),
          body: SafeArea(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: BodyConvertion(
                  args: widget.args,
                )),
          ),
          bottomSheet: BottomSheetConversion(
            crypto: widget.args.cryptoData,
            userValue: widget.args.userCryptoValue,
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
