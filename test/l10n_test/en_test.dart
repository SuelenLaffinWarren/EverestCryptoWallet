import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../template_test.dart';
import 'template_l10n_test.dart';

void main() {
  testWidgets(
      'WHEN the emulador is in english language, THEN return english strings',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SetupWidgetTester(
        locale: Locale('en'), child: TemplateL10nTest()));

    expect(find.text('Crypto'), findsOneWidget);
    expect(find.text('Total coin value'), findsOneWidget);
    expect(find.text('Portfolio'), findsWidgets);
    expect(find.text('Movimentations'), findsWidgets);
    expect(find.text('Details'), findsOneWidget);
    expect(find.text('Current price'), findsOneWidget);
    expect(find.text('24h variation'), findsOneWidget);
    expect(find.text('The amount'), findsOneWidget);
    expect(find.text('Value'), findsOneWidget);
    expect(find.text('Convert currency'), findsOneWidget);
    expect(find.text('To Convert'), findsOneWidget);
    expect(find.text('Balance available'), findsOneWidget);
    expect(find.text('How much would you like to convert?'), findsOneWidget);
    expect(find.text('Estimated total'), findsOneWidget);
    expect(find.text('To receive'), findsOneWidget);
    expect(find.text('Review your conversion data'), findsOneWidget);
    expect(find.text('Review'), findsOneWidget);
    expect(find.text('Exchange'), findsOneWidget);
    expect(find.text('Complete conversion'), findsOneWidget);
    expect(find.text('Conversion performed'), findsOneWidget);
    expect(find.text('Proof'), findsOneWidget);
    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Movement quantity'), findsOneWidget);
    expect(find.text('Balance unavailable'), findsOneWidget);
    expect(find.text('Invalid value'), findsOneWidget);
    expect(find.text('Close'), findsOneWidget);
    expect(find.text('The value field is empty!'), findsOneWidget);
    expect(find.text('There are no movements'), findsOneWidget);
    expect(
        find.text('Complete currency conversion successful'), findsOneWidget);

    await tester.pumpAndSettle();
  });
}
