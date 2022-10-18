import '../../shared/template/app_bar.dart';
import '../widgets/body_convertion.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/utils/arguments.dart';

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
    return Scaffold(
      appBar: AppBarTemplate(title: AppLocalizations.of(context)!.toConvert),
      body: SafeArea(
        child: BodyConvertion(
          args: widget.args,
        ),
      ),
      bottomSheet: BottomSheetConversion(
        crypto: widget.args.cryptoData,
        userValue: widget.args.userCryptoValue,
      ),
    );
  }
}
