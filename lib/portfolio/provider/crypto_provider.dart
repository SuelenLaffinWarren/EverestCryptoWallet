import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/crypto_details/model/market_graphic_view_data.dart';
import 'package:everest_card2_listagem/portfolio/useCase/total_crypto_value_use_case.dart';
import '../../shared/api/repository/repository_provider.dart';
import '../useCase/crypto_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/crypto_view_data.dart';

class CriptoNotifier extends StateNotifier<CryptoViewData> {
  CriptoNotifier()
      : super(
          CryptoViewData(
            current_price: Decimal.parse('0'),
            id: '',
            image: '',
            name: '',
            price_change_percentage_24h: 0.00,
            symbol: '',
          ),
        );
  void variationChange(int time) {
    time = time == 1 ? 2 : time;
    state.price_change_percentage_24h;
  }
}

var cryptoModelProvider = StateNotifierProvider<CriptoNotifier, CryptoViewData>(
  (ref) => CriptoNotifier(),
);
var currentPriceProvider = StateNotifierProvider<CurrentPriceNotifier, Decimal>(
  (ref) => CurrentPriceNotifier(),
);

class CurrentPriceNotifier extends StateNotifier<Decimal> {
  CurrentPriceNotifier() : super(Decimal.parse('0'));

  void getActualValueCrypto(int days, MarketGraphicViewData market) {
    state = Decimal.parse('${market.values[days - 1]}');
  }
}

class DecimalFormatter {
  static double decimalFormatter(Decimal number) {
    return double.parse(number.toString());
  }
}

class FormatValueNumber {
  static String format(Decimal price) {
    return NumberFormat.simpleCurrency(locale: 'pt-BR')
        .format(price.toDouble());
  }

  static String formatDouble(double price) {
    return NumberFormat.simpleCurrency(locale: 'pt-BR').format(price);
  }
}

final getCryptoUseCaseProvider = Provider((ref) {
  return CryptoUseCase(repository: ref.read(repositoryCryptoProvider));
});

final cryptoProvider = FutureProvider<List<CryptoViewData>>((ref) async {
  return ref.read(getCryptoUseCaseProvider).execute();
});

final getDataCryptoProvider = Provider(
    (ref) => CryptoUseCase(repository: ref.read(repositoryCryptoProvider)));

final cryptoListProvider = FutureProvider<List<CryptoViewData>>(
    (ref) async => await ref.read(getDataCryptoProvider).execute());
final currentPriceGraphicProvider = StateProvider((ref) => Decimal.parse('0'));

final totalUseCaseProvider = StateProvider((ref) =>
    TotalCryptoValueUseCase(repository: ref.watch(repositoryCryptoProvider)));

final getTotalProvider = FutureProvider.family<Decimal, List<double>>(
    (ref, args) => ref.watch(totalUseCaseProvider).totalMoney(args));

final userTotalProvider =
    Provider((ref) => [0.78, 1.54, 3.45, 0.52, 0.45, 1.75]);
