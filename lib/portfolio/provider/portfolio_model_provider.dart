import 'package:decimal/decimal.dart';
import '../model/portfolio_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CriptoNotifier extends StateNotifier<PortfolioModel> {
  CriptoNotifier()
      : super(
          PortfolioModel(
            userValueCrypto: Decimal.parse('0'),
            quantityUserCrypto: 0.00,
          ),
        );
}

var cryptoPortfolioProvider =
    StateNotifierProvider<CriptoNotifier, PortfolioModel>(
  (ref) => CriptoNotifier(),
);
