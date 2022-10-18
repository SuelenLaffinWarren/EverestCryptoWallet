import 'dart:io';

import 'package:everest_card2_listagem/shared/bottom_navigation/bottom_navigation_page.dart';
import 'package:everest_card2_listagem/shared/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

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

  testWidgets('WHEN the list view is righ, THEN return the cryptos',
      (WidgetTester tester) async {
    await loadPage(tester, const SetupWidgetTester(child: SplashScreen()));

    expect(find.byType(Lottie), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);

    await tester.pump(const Duration(seconds: 10));
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('WHEN the bottom is right THEN return the bottom navigation',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        const SetupWidgetTester(
            child: BottomNavigationWallet(
          selectedIndex: 0,
        )));

    await tester.pump(const Duration(seconds: 5));
  });
}
