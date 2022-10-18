import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/conversion/view/conversion_screen.dart';
import 'package:everest_card2_listagem/conversion/widgets/bottom_sheet_conversion.dart';
import 'package:everest_card2_listagem/conversion/widgets/text_field_conversion.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
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

  testWidgets('WHEN the widgets are working, THEN return the conversion page ',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        SetupWidgetTester(
            child: ConversionScreen(
          args: Arguments(
              cryptoData: CryptoViewData(
                  current_price: Decimal.one,
                  id: 'bitcoin',
                  image: Faker().image.image(),
                  name: 'Bitcoin',
                  price_change_percentage_24h: 1,
                  symbol: 'btc'),
              userCryptoValue: Decimal.one),
        )));

    await tester.pumpAndSettle();
  });
  testWidgets('WHEN the widgets are working, THEN return the bottom sheet ',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        SetupWidgetTester(
          child: BottomSheetConversion(
              crypto: CryptoViewData(
                  current_price: Decimal.one,
                  id: 'bitcoin',
                  image: Faker().image.image(),
                  name: 'Bitcoin',
                  price_change_percentage_24h: 1,
                  symbol: 'btc'),
              userValue: Decimal.one),
        ));

    await tester.pump();
  });
  testWidgets('WHEN the widgets are working, THEN return the textfield ',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        SetupWidgetTester(
            child: TextFieldConversion(
          args: Arguments(
              cryptoData: CryptoViewData(
                  current_price: Decimal.one,
                  id: 'bitcoin',
                  image: Faker().image.image(),
                  name: 'Bitcoin',
                  price_change_percentage_24h: 1,
                  symbol: 'btc'),
              userCryptoValue: Decimal.one),
          hintText: '',
          onChange: (String) {},
        )));

    await tester.pump();
  });
}
