import 'package:everest_card2_listagem/success/view/sucess_conversion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

import 'helper_setup/template_test.dart';

void main() {
  testWidgets(
      'WHEN Success Page is working, THEN return lottie and the sucess page ',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const SetupWidgetTester(locale: null, child: SucessConversionScreen()));
    final Finder lottieFinder = find.byType(Lottie);
    expect(lottieFinder, findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(SizedBox), findsWidgets);
    expect(find.byType(SingleChildScrollView), findsOneWidget);

    await tester.tap(find.byType(IconButton));

    await tester.pump(const Duration(seconds: 5));
  });
}
