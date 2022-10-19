import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
import 'package:everest_card2_listagem/revision/view/revision_screen.dart';
import 'package:everest_card2_listagem/revision/widgets/revision_button.dart';
import 'package:everest_card2_listagem/shared/utils/arguments.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helper_setup/template_test.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  Future<void> loadPage(WidgetTester tester, Widget child) async {
    await tester.pumpWidget(MaterialApp(
      home: SetupWidgetTester(
        locale: null,
        child: child,
      ),
    ));
  }

  testWidgets('WHEN the page is right THEN return the revision page',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      SetupWidgetTester(
        locale: null,
        child: RevisionScreen(
          args: Arguments(
              cryptoData: CryptoViewData(
                  current_price: Decimal.one,
                  id: 'bitcoin',
                  image: Faker().image.image(),
                  name: 'Bitcoin',
                  price_change_percentage_24h: 1,
                  symbol: 'btc'),
              userCryptoValue: Decimal.one),
        ),
      ),
    );
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SafeArea), findsWidgets);
    await tester.pump(const Duration(seconds: 5));
  });
  testWidgets('WHEN the button is right THEN navigate to success page',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      SetupWidgetTester(
        locale: null,
        child: RevisionButton(
          args: Arguments(
              cryptoData: CryptoViewData(
                  current_price: Decimal.one,
                  id: 'bitcoin',
                  image: Faker().image.image(),
                  name: 'Bitcoin',
                  price_change_percentage_24h: 1,
                  symbol: 'btc'),
              userCryptoValue: Decimal.one),
          secondCrypto: StateController(CryptoViewData(
              current_price: Decimal.one,
              id: 'bitcoin',
              image: Faker().image.image(),
              name: 'Bitcoin',
              price_change_percentage_24h: 1,
              symbol: 'btc')),
          totalEstimated: StateController(double.parse('1000')),
        ),
      ),
    );

    await tester.tap(find.byType(MaterialButton));
    await tester.pump(const Duration(seconds: 5));
  });
}
