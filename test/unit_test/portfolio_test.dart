import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
import 'package:faker/faker.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final userAmount = CryptoViewData(
      id: Faker().lorem.word(),
      symbol: Faker().lorem.word(),
      name: Faker().lorem.word(),
      image: Faker().image.image(),
      current_price: Decimal.parse('1000'),
      price_change_percentage_24h:
          Faker().randomGenerator.integer(20).toDouble());

  test('WHEN the method is working, THEN return the userAmount', () {
    expect(userAmount.userValueMoney(Decimal.ten),
        userAmount.userValueMoney(Decimal.ten));
  });
}
