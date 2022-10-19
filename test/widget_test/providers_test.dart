import 'package:everest_card2_listagem/conversion/provider/conversion_provider.dart';
import 'package:everest_card2_listagem/crypto_details/providers_details/providers_details.dart';
import 'package:everest_card2_listagem/movimentations/provider/movimentations_provider.dart';
import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';
import 'package:everest_card2_listagem/portfolio/provider/portfolio_model_provider.dart';
import 'package:everest_card2_listagem/shared/api/endPoint/endPoint_provider.dart';
import 'package:everest_card2_listagem/shared/api/repository/repository_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter/material.dart';

import 'helper_setup/template_test.dart';

class ProvidersTest extends StatefulHookConsumerWidget {
  const ProvidersTest({Key? key}) : super(key: key);

  @override
  ConsumerState<ProvidersTest> createState() => _ProvidersTestState();
}

class _ProvidersTestState extends ConsumerState<ProvidersTest> {
  @override
  Widget build(BuildContext context) {
    ref.watch(conversionPriceProvider);
    ref.watch(conversionProvider);
    ref.watch(cryptoModelProvider);
    ref.watch(cryptoSymbolProvider);
    ref.watch(cryptoPortfolioProvider);
    ref.watch(movimentationListProvider);
    ref.watch(movimentationProvider);
    ref.watch(totalEstimatedProvider);
    ref.watch(totalUseCaseProvider);
    ref.watch(repositoryCryptoProvider);
    ref.watch(repositoryMarketProvider);
    ref.watch(marketEndPointProvider);
    ref.watch(userTotalCryptoProvider);
    ref.watch(userTotalProvider);
    ref.watch(buttonDaysProvider);
    ref.watch(totalUseCaseProvider);
    ref.watch(currentPriceProvider);
    ref.watch(getCryptoUseCaseProvider);
    ref.watch(allCryptoListProvider);
    ref.watch(dateNowProvider);

    return Container();
  }
}

void main() {
  testWidgets('WHEN the provider working, THEN the app working',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SetupWidgetTester(
      locale: null,
      child: ProvidersTest(),
    ));

    await tester.pump(const Duration(seconds: 5));
    await tester.pump(const Duration(seconds: 5));
  });
}
