import 'dart:io';
import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/crypto_details/view/crypto_details_screen.dart';
import 'package:everest_card2_listagem/crypto_details/widgets/body_crypto_details.dart';
import 'package:everest_card2_listagem/crypto_details/widgets/button_day_graphic.dart';
import 'package:everest_card2_listagem/crypto_details/widgets/row_buttons_graphic_days.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'template_test.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  Future<void> loadPage(WidgetTester tester, Widget child) async {
    await tester.pumpWidget(MaterialApp(
      home: SetupWidgetTester(
        child: child,
      ),
    ));
  }

  testWidgets('WHEN the page is right THEN return the page',
      (WidgetTester tester) async {
    await loadPage(
        tester, const SetupWidgetTester(child: RowButtonsGraphicDays()));
    expect(find.byType(ButtonDayGraphic), findsWidgets);
    expect(find.text("5D"), findsOneWidget);
    expect(find.text("15D"), findsOneWidget);
    expect(find.text("30D"), findsOneWidget);
    expect(find.text("45D"), findsOneWidget);
    expect(find.text("90D"), findsOneWidget);
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('WHEN the page is right THEN return the page',
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
    await tester.pump(const Duration(seconds: 5));
  });
  testWidgets('WHEN the page is right THEN return the page',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        BodyCryptoDetails(
          crypto: CryptoViewData(
              current_price: Decimal.ten,
              id: 'bitcoin',
              image: Faker().image.image(),
              name: 'Bitcoin',
              price_change_percentage_24h:
                  Faker().randomGenerator.integer(10).toDouble(),
              symbol: 'btc'),
          userValue: Decimal.ten,
        ));

    await tester.pump(const Duration(seconds: 5));
  });
}
