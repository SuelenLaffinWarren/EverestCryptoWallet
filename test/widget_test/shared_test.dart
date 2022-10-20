import 'dart:io';

import 'package:everest_card2_listagem/shared/bottom_navigation/bottom_navigation_page.dart';
import 'package:everest_card2_listagem/shared/template/app_bar.dart';
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

  testWidgets('WHEN the bottom is right THEN return the bottom navigation',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        const SetupWidgetTester(
            locale: null,
            child: BottomNavigationWallet(
              selectedIndex: 0,
            )));
    await tester.tap(find.byType(BottomNavigationBar));
    await tester.pump(const Duration(seconds: 5));
  });
  testWidgets(
      'WHEN the app bar template is right THEN return the app bar in the pages',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        SetupWidgetTester(
            locale: null,
            child: AppBarTemplate(
              title: '',
            )));
    await tester.tap(find.byType(IconButton));

    await tester.pump(const Duration(seconds: 5));
  });
}
