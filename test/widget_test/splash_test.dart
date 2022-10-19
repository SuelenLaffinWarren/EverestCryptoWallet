import 'dart:io';

import 'package:everest_card2_listagem/shared/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

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

  testWidgets('WHEN the list view is righ, THEN return the home page(porfolio)',
      (WidgetTester tester) async {
    await loadPage(
        tester, const SetupWidgetTester(locale: null, child: SplashScreen()));

    expect(find.byType(Lottie), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);

    await tester.pump(const Duration(seconds: 10));
    await tester.pump(const Duration(seconds: 10));
  });
}
