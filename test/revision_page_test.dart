import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
import 'package:everest_card2_listagem/revision/view/revision_screen.dart';
import 'package:everest_card2_listagem/shared/utils/arguments.dart';
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
      tester,
      SetupWidgetTester(
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
    await tester.pump(const Duration(seconds: 5));
  });
}
