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
  // void variationChange(int time) {
  //   time = time == 1 ? 2 : time;
  //   state.price_change_percentage_24h;
  // }

}

var cryptoPortfolioProvider =
    StateNotifierProvider<CriptoNotifier, PortfolioModel>(
  (ref) => CriptoNotifier(),
);
