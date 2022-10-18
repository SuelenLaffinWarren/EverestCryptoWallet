import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/portfolio/mapper/crypto_mapper.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
import 'package:everest_card2_listagem/portfolio/view/home_portofolio_screen.dart';
import 'package:everest_card2_listagem/portfolio/widgtes/crypto_list_tile.dart';
import 'package:everest_card2_listagem/portfolio/widgtes/crypto_list_view.dart';
import 'package:everest_card2_listagem/portfolio/widgtes/info_title_wallet_column_screen.dart';
import 'package:everest_card2_listagem/shared/bottom_navigation/bottom_navigation_page.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        tester, const SetupWidgetTester(child: HomePortfolioScreen()));
    expect(find.byType(CryptoListView), findsOneWidget);
    expect(find.byType(InfoTitleColumnWallet), findsOneWidget);
    expect(find.byType(BottomNavigationWallet), findsOneWidget);
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('WHEN the page is right THEN return the page',
      (WidgetTester tester) async {
    await loadPage(
        tester, const SetupWidgetTester(child: InfoTitleColumnWallet()));
    expect(find.text('Crypto'), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsOneWidget);
    await tester.pump(const Duration(seconds: 5));
  });
  testWidgets('WHEN the page is right THEN return the page',
      (WidgetTester tester) async {
    await loadPage(tester, const SetupWidgetTester(child: CryptoListView()));

    await tester.pump(const Duration(seconds: 5));
  });
  testWidgets('WHEN the page is right THEN return the page',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        SetupWidgetTester(
            child: CryptoListTile(
          crypto: CryptoViewData(
              current_price: Decimal.one,
              id: 'bitcoin',
              image: Faker().image.image(),
              name: 'Bitcoin',
              price_change_percentage_24h: 1,
              symbol: 'btc'),
          isVisible: StateController(const bool.hasEnvironment('false')),
          userCryptoValue: Decimal.ten,
        )));

    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('WHEN the page is right THEN return the page',
      (WidgetTester tester) async {
    await loadPage(tester, const BottomNavigationWallet(selectedIndex: 1));
    await tester.pump();
  });
}
