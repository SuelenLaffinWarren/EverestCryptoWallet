import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/conversion/provider/conversion_provider.dart';
import 'package:everest_card2_listagem/crypto_details/model/market_graphic_view_data.dart';
import 'package:everest_card2_listagem/crypto_details/providers_details/providers_details.dart';
import 'package:everest_card2_listagem/l10n/app_localizations.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_list_view_data.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';
import 'package:everest_card2_listagem/shared/routes/routes.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SetupWidgetTester extends StatelessWidget {
  final Widget child;
  final Locale? locale;

  const SetupWidgetTester({Key? key, required this.child, required this.locale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CryptoViewData bitcoin = CryptoViewData(
      current_price: Decimal.one,
      id: 'bitcoin',
      image: Faker().image.image(),
      name: 'Bitcoin',
      price_change_percentage_24h: 1,
      symbol: 'btc',
    );

    final CryptoViewData ethereum = CryptoViewData(
      current_price: Decimal.one,
      id: 'ethereum',
      image: Faker().image.image(),
      name: 'Ethereum',
      price_change_percentage_24h: 3,
      symbol: 'eth',
    );

    final CryptoViewData litecoin = CryptoViewData(
      current_price: Decimal.ten,
      id: 'litecoin',
      image: Faker().image.image(),
      name: 'Litecoin',
      price_change_percentage_24h: 2,
      symbol: 'ltc',
    );
    final MarketGraphicViewData marketData = MarketGraphicViewData(values: [
      [0, 4, 6, 10, 20]
    ]);
    return ProviderScope(
      overrides: [
        secondSelectedCryptoProvider.overrideWithValue(
          StateController(bitcoin),
        ),
        cryptoListProvider.overrideWithValue(
          AsyncValue.data(
            CryptoListViewData(
              cryptoListViewData: [bitcoin, litecoin, ethereum],
            ),
          ),
        ),
        marketGraphicDataProvider.overrideWithProvider(
          (argument) => Provider(
            (ref) => AsyncValue.data(
              MarketGraphicViewData(
                values: List<List<num>>.generate(90, (index) => [index]),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        locale: locale ?? const Locale('en'),
        onGenerateRoute: RoutesApp.generateRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: child,
          ),
        ),
      ),
    );
  }
}
