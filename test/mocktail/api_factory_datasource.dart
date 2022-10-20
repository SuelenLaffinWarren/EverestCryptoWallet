import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';

class ApiFakeModel {
  static List<Map<String, dynamic>> getAllCrypto() => [
        {
          'id': Faker().person.toString(),
          'symbol': Faker().lorem.toString(),
          'name': Faker().lorem.toString(),
          'image': Faker().image.image(),
          'current_price': Decimal.ten,
          'price_change_percentage_24h': Faker().randomGenerator.integer(10),
        },
      ];
  static Map<String, List<List<num>>> getCryptoMarketChart() => {
        'prices': [
          faker.randomGenerator.numbers(100, 100),
          faker.randomGenerator.numbers(100, 100),
        ],
      };
}
