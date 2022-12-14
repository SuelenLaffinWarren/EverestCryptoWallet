import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/conversion/view/conversion_screen.dart';
import 'package:everest_card2_listagem/conversion/widgets/body_convertion.dart';
import 'package:everest_card2_listagem/conversion/widgets/bottom_sheet_conversion.dart';
import 'package:everest_card2_listagem/conversion/widgets/row_convert_buttons.dart';
import 'package:everest_card2_listagem/conversion/widgets/text_field_conversion.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
import 'package:everest_card2_listagem/shared/utils/arguments.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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

  testWidgets('WHEN the widgets are working, THEN return the conversion page ',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        SetupWidgetTester(
            locale: null,
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

    await tester.pump();
  });
  testWidgets('WHEN the widgets are working, THEN return the bottom sheet ',
      (WidgetTester tester) async {
    await tester.pumpWidget(SetupWidgetTester(
      locale: null,
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
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump(const Duration(seconds: 5));
  });
  testWidgets('WHEN the widgets are working, THEN return the body convertion ',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        SetupWidgetTester(
          locale: null,
          child: BodyConvertion(
              args: Arguments(
            cryptoData: CryptoViewData(
                current_price: Decimal.one,
                id: 'bitcoin',
                image: Faker().image.image(),
                name: 'Bitcoin',
                price_change_percentage_24h: 1,
                symbol: 'btc'),
            userCryptoValue: Decimal.one,
          )),
        ));
    await tester.tap(find.byType(RowConvertButtons));
    await tester.tap(find.byType(TextFieldConversion));
    expect(find.byType(RowConvertButtons), findsOneWidget);
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  });
  testWidgets('WHEN the widgets are working, THEN return the textfield ',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        SetupWidgetTester(
            locale: null,
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
    await tester.tap(find.byType(TextFormField));
    await tester.pump(const Duration(seconds: 5));
  });
}
