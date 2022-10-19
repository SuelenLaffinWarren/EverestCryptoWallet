import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../template_test.dart';
import 'template_l10n_test.dart';

void main() {
  testWidgets(
      'WHEN the emulador is in Spanish language, THEN return spanish strings',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SetupWidgetTester(
        locale: Locale('es'), child: TemplateL10nTest()));

    expect(find.text('Cripto'), findsOneWidget);
    expect(find.text('Valor total de la moneda'), findsOneWidget);
    expect(find.text('Portafolio'), findsWidgets);
    expect(find.text('Movimientos'), findsWidgets);
    expect(find.text('Detalles'), findsOneWidget);
    expect(find.text('Precio actual'), findsOneWidget);
    expect(find.text('Variación 24h'), findsOneWidget);
    expect(find.text('La cantidad'), findsOneWidget);
    expect(find.text('Valor'), findsOneWidget);
    expect(find.text('Convertir moneda'), findsOneWidget);
    expect(find.text('Para convertir'), findsOneWidget);
    expect(find.text('Saldo disponible'), findsOneWidget);
    expect(find.text('¿Cuánto te gustaría convertir?'), findsOneWidget);
    expect(find.text('Total Estimado'), findsOneWidget);
    expect(find.text('Revisar'), findsOneWidget);
    expect(find.text('Revisa tus datos de conversión'), findsOneWidget);
    expect(find.text('Para recibir'), findsOneWidget);
    expect(find.text('Intercambio'), findsOneWidget);
    expect(find.text('Conversión completa'), findsOneWidget);
    expect(find.text('Conversión realizada'), findsOneWidget);
    expect(find.text('Prueba'), findsOneWidget);
    expect(find.text('Fecha'), findsOneWidget);
    expect(find.text('Cantidad de movimiento'), findsOneWidget);
    expect(find.text('Saldo no disponible'), findsOneWidget);
    expect(find.text('Valor no válido'), findsOneWidget);
    expect(find.text('Cerca'), findsOneWidget);
    expect(find.text('No hay movimientos'), findsOneWidget);
    expect(find.text('El campo de valor está vacío!'), findsOneWidget);
    expect(find.text('Conversión de moneda completa exitosa'), findsOneWidget);

    await tester.pumpAndSettle();
  });
}
