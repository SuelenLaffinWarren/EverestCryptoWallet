import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TemplateL10nTest extends StatelessWidget {
  const TemplateL10nTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppLocalizations.of(context)!.balanceAvailable),
        Text(AppLocalizations.of(context)!.balanceUnavailable),
        Text(AppLocalizations.of(context)!.close),
        Text(AppLocalizations.of(context)!.coinLocale),
        Text(AppLocalizations.of(context)!.completeConversion),
        Text(AppLocalizations.of(context)!.conversionPerformed),
        Text(AppLocalizations.of(context)!.convertCurrency),
        Text(AppLocalizations.of(context)!.crypto),
        Text(AppLocalizations.of(context)!.currencyConversionSuccessful),
        Text(AppLocalizations.of(context)!.currentPrice),
        Text(AppLocalizations.of(context)!.date),
        Text(AppLocalizations.of(context)!.dateFormat),
        Text(AppLocalizations.of(context)!.details),
        Text(AppLocalizations.of(context)!.estimatedTotal),
        Text(AppLocalizations.of(context)!.exchange),
        Text(AppLocalizations.of(context)!.howLikeConvert),
        Text(AppLocalizations.of(context)!.invalidValue),
        Text(AppLocalizations.of(context)!.language),
        Text(AppLocalizations.of(context)!.locale),
        Text(AppLocalizations.of(context)!.movementQuantity),
        Text(AppLocalizations.of(context)!.movimentations),
        Text(AppLocalizations.of(context)!.noMovimentations),
        Text(AppLocalizations.of(context)!.portfolio),
        Text(AppLocalizations.of(context)!.portfolio),
        Text(AppLocalizations.of(context)!.proof),
        Text(AppLocalizations.of(context)!.review),
        Text(AppLocalizations.of(context)!.reviewQuestion),
        Text(AppLocalizations.of(context)!.theAmount),
        Text(AppLocalizations.of(context)!.toConvert),
        Text(AppLocalizations.of(context)!.toReceive),
        Text(AppLocalizations.of(context)!.totalCoinValue),
        Text(AppLocalizations.of(context)!.twentyFourHVariation),
        Text(AppLocalizations.of(context)!.value),
        Text(AppLocalizations.of(context)!.valueFieldEmpty),
      ],
    );
  }
}
