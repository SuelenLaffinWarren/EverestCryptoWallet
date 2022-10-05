import 'package:decimal/decimal.dart';

import '../../portfolio/model/crypto_view_data.dart';

class Arguments {
  CryptoViewData cryptoData;
  Decimal userCryptoValue;

  Arguments({
    required this.cryptoData,
    required this.userCryptoValue,
  });
}
