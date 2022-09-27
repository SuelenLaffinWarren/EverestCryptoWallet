import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/portfolio_model.dart';

class PortfolioProvider extends ChangeNotifier {
  List<PortfolioModel> listUserCrypto() {
    return [
      PortfolioModel(
          valueUserCrypto: Decimal.parse('12500'), idCrypto: 'bitcoin'),
      PortfolioModel(
          valueUserCrypto: Decimal.parse('7450'), idCrypto: 'litecoin'),
      PortfolioModel(
          valueUserCrypto: Decimal.parse('420'), idCrypto: 'ethereum'),
      PortfolioModel(
          valueUserCrypto: Decimal.parse('8700'), idCrypto: 'dogecoin'),
      PortfolioModel(
          valueUserCrypto: Decimal.parse('29600'), idCrypto: 'tether'),
      PortfolioModel(
          valueUserCrypto: Decimal.parse('29600'), idCrypto: 'solana'),
    ];
  }
}

var portfolioModelProvider = StateProvider<PortfolioProvider>(
  (ref) => PortfolioProvider(),
);
