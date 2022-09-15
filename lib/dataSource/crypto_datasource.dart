import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/shared/models/crypto_model.dart';

class CryptoDatasource {
  List<CryptoModel> getAllCrypto() {
    return [
      CryptoModel(
        currentePriceCrypto: Decimal.parse('100745.00'),
        totalCrypto: Decimal.parse('6557.00'),
        quantity: 0.65,
        abrvCrypto: 'BTC',
        imagePath: 'assets/images/bitcoin.png',
        nameCrypto: 'Bitcoin',
      ),
      CryptoModel(
        currentePriceCrypto: Decimal.parse('100745.00'),
        totalCrypto: Decimal.parse('7996.00'),
        quantity: 0.94,
        abrvCrypto: 'ETH',
        imagePath: 'assets/images/ETH.png',
        nameCrypto: 'Ethereum',
      ),
      CryptoModel(
        currentePriceCrypto: Decimal.parse('100745.00'),
        totalCrypto: Decimal.parse('245.00'),
        quantity: 0.82,
        abrvCrypto: 'LTC',
        imagePath: 'assets/images/LTC.png',
        nameCrypto: 'Litecoin',
      ),
    ];
  }
}
