import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';
import 'package:everest_card2_listagem/portfolio/view/home_portofolio_screen.dart';
import 'package:everest_card2_listagem/portfolio/widgtes/crypto_list_tile.dart';
import 'package:everest_card2_listagem/portfolio/widgtes/crypto_list_view.dart';
import 'package:everest_card2_listagem/portfolio/widgtes/info_title_wallet_column_screen.dart';
import 'package:everest_card2_listagem/shared/bottom_navigation/bottom_navigation_page.dart';
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

  testWidgets('WHEN the page is right THEN return the  portfolio page',
      (WidgetTester tester) async {
    await loadPage(tester,
        const SetupWidgetTester(locale: null, child: HomePortfolioScreen()));
    expect(find.byType(CryptoListView), findsOneWidget);
    expect(find.byType(InfoTitleColumnWallet), findsOneWidget);
    expect(find.byType(BottomNavigationWallet), findsOneWidget);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Expanded), findsWidgets);
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('WHEN the page is right THEN return the info title',
      (WidgetTester tester) async {
    await loadPage(tester,
        const SetupWidgetTester(locale: null, child: InfoTitleColumnWallet()));
    expect(find.text('Crypto'), findsOneWidget);
    expect(find.byType(SizedBox), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Text), findsWidgets);

    expect(find.byIcon(Icons.visibility), findsOneWidget);
    await tester.tap(find.byType(IconButton));
    await tester.pump(const Duration(seconds: 5));
  });
  testWidgets('WHEN the page is right THEN return the list view loading',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      SetupWidgetTester(
        locale: null,
        child: ProviderScope(
          overrides: [
            cryptoListProvider.overrideWithValue(const AsyncValue.loading())
          ],
          child: const CryptoListView(),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 5));
  });
  testWidgets('WHEN the page is right THEN return the list view error',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      SetupWidgetTester(
        locale: null,
        child: ProviderScope(
          overrides: [
            cryptoListProvider
                .overrideWithValue(const AsyncValue.error(StackTrace))
          ],
          child: const CryptoListView(),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 5));
  });
  testWidgets('WHEN the page is right THEN return the list tile',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        SetupWidgetTester(
            locale: null,
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
    await tester.pump(const Duration(seconds: 5));
  });
}
