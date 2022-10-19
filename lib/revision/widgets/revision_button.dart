import 'package:everest_card2_listagem/conversion/provider/conversion_provider.dart';
import 'package:everest_card2_listagem/movimentations/model/movimentations_model.dart';
import 'package:everest_card2_listagem/movimentations/provider/movimentations_provider.dart';
import 'package:everest_card2_listagem/success/view/sucess_conversion_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/utils/arguments.dart';

class RevisionButton extends StatefulHookConsumerWidget {
  const RevisionButton({
    Key? key,
    required this.secondCrypto,
    required this.args,
    required this.totalEstimated,
  }) : super(key: key);

  final StateController<CryptoViewData> secondCrypto;
  final Arguments args;
  final StateController<double> totalEstimated;

  @override
  ConsumerState<RevisionButton> createState() => _RevisionButtonState();
}

class _RevisionButtonState extends ConsumerState<RevisionButton> {
  @override
  Widget build(BuildContext context) {
    final convertPrice = ref.watch(conversionPriceProvider.state);
    final controller = ref.watch(textFieldControllerProvider.state);
    return MaterialButton(
      textColor: Colors.white,
      color: const Color.fromARGB(223, 242, 27, 109),
      onPressed: () {
        DateTime dateNow = DateTime.now();
        MovimentationsModel movimentationModel = MovimentationsModel(
          dateNow: dateNow,
          firstSymbol: widget.args.cryptoData.symbol.toUpperCase(),
          secondCrypto: widget.secondCrypto.state.symbol.toUpperCase(),
          convertPrice: convertPrice.state,
          totalEstimated: widget.totalEstimated.state,
          controller: controller.state.text,
        );
        ref
            .watch(movimentationListProvider.state)
            .state
            .add(movimentationModel);
        Navigator.of(context).pushNamed(SucessConversionScreen.route);
      },
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color.fromARGB(223, 244, 9, 107),
        ),
      ),
      child: Text(
        AppLocalizations.of(context)!.completeConversion,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}
