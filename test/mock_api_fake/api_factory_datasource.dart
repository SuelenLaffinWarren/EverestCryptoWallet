import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';

class ApiFakeModel {
  static Map<String, dynamic> getAllCryptosFake() => {
        'id': Faker().person.toString(),
        'symbol': Faker().lorem.toString(),
        'name': Faker().lorem.toString(),
        'image': Faker().image.image(),
        'current_price': Decimal.ten,
        'price_change_percentage_24h': Faker().randomGenerator.integer(10),
      };
}
  // static CryptoViewData cryptoBTC = CryptoViewData(
  //   
  // );

  // static CryptoViewData cryptoLTC = CryptoViewData(
  //   id: 'litecoin',
  //   symbol: 'ltc',
  //   name: 'litecoin',
  //   image: Faker().image.image(),
  //   current_price: Decimal.ten,
  //   price_change_percentage_24h: 2,
  // );

  // static CryptoViewData cryptoETH = CryptoViewData(
  //   id: 'ethereum',
  //   symbol: 'eth',
  //   name: 'ethereum',
  //   image: 'assets/images/ETH.png',
  //   current_price: Decimal.ten,
  //   price_change_percentage_24h: 2,
  // );
