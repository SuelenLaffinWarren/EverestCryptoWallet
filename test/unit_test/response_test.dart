import 'package:everest_card2_listagem/shared/api/response/crypto_response.dart';
import 'package:everest_card2_listagem/shared/api/response/market_graphic_response.dart';
import 'package:faker/faker.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  setUp() {
    final faker = Faker();
  }

  test(
      'WHEN the methods from crypto response are working, THEN return the info from api',
      () async {
    var cryptoResponse = CryptoResponse(
        faker.lorem.word(),
        faker.lorem.word(),
        faker.lorem.word(),
        faker.image.image(),
        faker.randomGenerator.decimal(scale: 100),
        faker.randomGenerator.integer(10).toDouble());

    var result = cryptoResponse.toJson();
    expect(result.isEmpty, false);
  });

  test(
      'WHEN the methods from market response are working, THEN return the info from api',
      () async {
    var marketResponse = MarketGraphicResponse([
      [faker.randomGenerator.integer(100)]
    ]);

    var result = marketResponse.toJson();

    expect(result.isEmpty, false);
  });
}
