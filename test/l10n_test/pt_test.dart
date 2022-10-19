import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_test/helper_setup/template_test.dart';
import 'template_l10n_test.dart';

void main() {
  testWidgets(
      'WHEN the emulador is in Portuguese language, THEN return portuguese string',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SetupWidgetTester(
        locale: Locale('pt'), child: TemplateL10nTest()));

    expect(find.text('Cripto'), findsOneWidget);
    expect(find.text('Valor total da moeda'), findsOneWidget);
    expect(find.text('Portfolio'), findsWidgets);
    expect(find.text('Movimentações'), findsWidgets);
    expect(find.text('Detalhes'), findsOneWidget);
    expect(find.text('Preço atual'), findsOneWidget);
    expect(find.text('Variação 24h'), findsOneWidget);
    expect(find.text('Quantidade'), findsOneWidget);
    expect(find.text('Valor'), findsOneWidget);
    expect(find.text('Converter moeda'), findsOneWidget);
    expect(find.text('Converter'), findsOneWidget);
    expect(find.text('Saldo disponível'), findsOneWidget);
    expect(find.text('Quanto você gostaria de converter?'), findsOneWidget);
    expect(find.text('Total estimado'), findsOneWidget);
    expect(find.text('Revisar'), findsOneWidget);
    expect(find.text('Revise os dados da sua conversão'), findsOneWidget);
    expect(find.text('Receber'), findsOneWidget);
    expect(find.text('Câmbio'), findsOneWidget);
    expect(find.text('Concluir Conversão'), findsOneWidget);
    expect(find.text('Conversão efetuada'), findsOneWidget);
    expect(find.text('Comprovante'), findsOneWidget);
    expect(find.text('Data'), findsOneWidget);
    expect(find.text('Qtd da movimentação'), findsOneWidget);
    expect(find.text('Saldo indisponível'), findsOneWidget);
    expect(find.text('Valor inválido'), findsOneWidget);
    expect(find.text('Fechar'), findsOneWidget);
    expect(find.text('O campo de valor está vazio!'), findsOneWidget);
    expect(find.text('Não há movimentações'), findsOneWidget);
    expect(
        find.text('Conversão de moeda efetuada com sucesso!'), findsOneWidget);

    await tester.pumpAndSettle();
  });
}
