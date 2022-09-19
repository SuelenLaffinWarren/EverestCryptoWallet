import 'package:everest_card2_listagem/shared/models/crypto_model.dart';

class CryptoDatasource {
  List<CryptoModel> getAllCrypto() {
    return [
      CryptoModel(
        onTapDetails: () {},
        currentPriceCrypto: 100745.00,
        totalAllWallet: 10000,
        currentValueCryptoWallet: 6557.00,
        quantity: 0.65554321,
        abrvCrypto: 'BTC',
        imagePath: 'assets/images/bitcoin.png',
        nameCrypto: 'Bitcoin',
        variationCrypto: -0.50,
      ),
      CryptoModel(
        onTapDetails: () {},
        currentPriceCrypto: 100745.00,
        totalAllWallet: 100000,
        currentValueCryptoWallet: 7996.00,
        quantity: 0.94,
        abrvCrypto: 'ETH',
        imagePath: 'assets/images/ETH.png',
        nameCrypto: 'Ethereum',
        variationCrypto: 1.75,
      ),
      CryptoModel(
        onTapDetails: () {},
        currentPriceCrypto: 100745.00,
        totalAllWallet: 100000,
        currentValueCryptoWallet: 245.00,
        quantity: 0.82,
        abrvCrypto: 'LTC',
        imagePath: 'assets/images/LTC.png',
        nameCrypto: 'Litecoin',
        variationCrypto: 2.05,
      ),
    ];
  }
}
