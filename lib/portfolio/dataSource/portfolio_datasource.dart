import 'package:decimal/decimal.dart';
import '../model/portfolio_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final portfolioDatasourceProvider = Provider((ref) => [
      PortfolioModel(
        userValueCrypto: Decimal.parse('12500'),
        quantityUserCrypto: 1.2500,
      ),
      PortfolioModel(
        userValueCrypto: Decimal.parse('550'),
        quantityUserCrypto: 0.55,
      ),
      PortfolioModel(
        userValueCrypto: Decimal.parse('35700'),
        quantityUserCrypto: 3.570,
      ),
      PortfolioModel(
        userValueCrypto: Decimal.parse('1000'),
        quantityUserCrypto: 1.0,
      ),
      PortfolioModel(
        userValueCrypto: Decimal.parse('9500'),
        quantityUserCrypto: 0.95,
      ),
    ]);
