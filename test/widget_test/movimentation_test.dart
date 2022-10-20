import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/movimentations/model/movimentations_model.dart';
import 'package:everest_card2_listagem/movimentations/view/movimentations_screen.dart';
import 'package:everest_card2_listagem/movimentations/widgets/list_tile_movimentations.dart';
import 'package:everest_card2_listagem/movimentations/widgets/row_proof_movimentations.dart';
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

  testWidgets(
      'WHEN the widgets are running, THEN return the movimentations page',
      (WidgetTester tester) async {
    await loadPage(tester, const MovimentationsScreen());
    expect(find.byType(BottomNavigationWallet), findsOneWidget);
    expect(find.byType(Scaffold), findsWidgets);
    expect(find.byType(Visibility), findsOneWidget);

    await tester.pump(const Duration(seconds: 4));
  });

  testWidgets('WHEN the widgets are running, THEN return the lisTile',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        ListTileMovimentation(
          isVisible: StateController(const bool.hasEnvironment('false')),
          movimentation: MovimentationsModel(
              controller: '',
              convertPrice: Decimal.ten,
              dateNow: DateTime.now(),
              firstSymbol: '',
              secondCrypto: '',
              totalEstimated: Faker().randomGenerator.integer(20).toDouble()),
        ));
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.byType(SizedBox), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Row), findsWidgets);

    await tester.tap(find.byType(ListTile));

    await tester.pumpAndSettle(const Duration(seconds: 5));
  });
  testWidgets('WHEN the widgets are running, THEN return the proof page',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        RowProofMovimentations(
          label1: '',
          label2: '',
        ));
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Row), findsWidgets);

    await tester.pump();
  });
}
