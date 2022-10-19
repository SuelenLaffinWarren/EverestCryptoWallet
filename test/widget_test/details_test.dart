import 'dart:io';
import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/crypto_details/providers_details/providers_details.dart';
import 'package:everest_card2_listagem/crypto_details/view/crypto_details_screen.dart';
import 'package:everest_card2_listagem/crypto_details/widgets/body_crypto_details.dart';
import 'package:everest_card2_listagem/crypto_details/widgets/button_day_graphic.dart';
import 'package:everest_card2_listagem/crypto_details/widgets/row_buttons_graphic_days.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helper_setup/template_test.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  List<Override> overrides = [];
  Future<void> loadPage(WidgetTester tester, Widget child) async {
    await tester.pumpWidget(MaterialApp(
      home: SetupWidgetTester(
        locale: null,
        child: child,
      ),
    ));
  }

  testWidgets('WHEN the page is right THEN return the row with the buttons',
      (WidgetTester tester) async {
    await loadPage(tester,
        const SetupWidgetTester(locale: null, child: RowButtonsGraphicDays()));
    expect(find.byType(ButtonDayGraphic), findsWidgets);
    expect(find.text("5D"), findsOneWidget);
    expect(find.text("15D"), findsOneWidget);
    expect(find.text("30D"), findsOneWidget);
    expect(find.text("45D"), findsOneWidget);
    expect(find.text("90D"), findsOneWidget);
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('WHEN the page is right THEN return the details page',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        DetailsCryptoScreen(
            crypto: CryptoViewData(
                current_price: Decimal.ten,
                id: 'bitcoin',
                image: Faker().image.image(),
                name: 'Bitcoin',
                price_change_percentage_24h:
                    Faker().randomGenerator.integer(10).toDouble(),
                symbol: 'btc'),
            userValue: Decimal.ten));
    expect(find.byType(BodyCryptoDetails), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);

    await tester.tap(find.byType(IconButton));

    await tester.pumpAndSettle(const Duration(seconds: 5));
  });
  testWidgets('WHEN the page is right THEN return the body details page',
      (WidgetTester tester) async {
    await tester.pumpWidget(SetupWidgetTester(
      locale: null,
      child: ProviderScope(
        overrides: [
          marketGraphicDataProvider.overrideWithProvider((argument) => Provider(
                (ref) => const AsyncValue.loading(),
              ))
        ],
        child: BodyCryptoDetails(
          crypto: CryptoViewData(
              current_price: Decimal.ten,
              id: 'bitcoin',
              image: Faker().image.image(),
              name: 'Bitcoin',
              price_change_percentage_24h:
                  Faker().randomGenerator.integer(10).toDouble(),
              symbol: 'btc'),
          userValue: Decimal.ten,
        ),
      ),
    ));

    await tester.pump(const Duration(seconds: 5));
    await tester.tap(find.byType(ElevatedButton));
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(SizedBox), findsWidgets);

    await tester.pump(const Duration(seconds: 5));
  });
}
