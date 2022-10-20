import 'package:decimal/decimal.dart';
import '../model/crypto_list_view_data.dart';
import '../useCase/total_crypto_value_use_case.dart';
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
}

var cryptoModelProvider = StateNotifierProvider<CriptoNotifier, CryptoViewData>(
  (ref) => CriptoNotifier(),
);
var currentPriceProvider = StateNotifierProvider<CurrentPriceNotifier, Decimal>(
  (ref) => CurrentPriceNotifier(),
);

class CurrentPriceNotifier extends StateNotifier<Decimal> {
  CurrentPriceNotifier() : super(Decimal.parse('0'));
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

final cryptoListProvider = FutureProvider<CryptoListViewData>((ref) async {
  return ref.read(getCryptoUseCaseProvider).execute();
});

final getCryptoUseCaseProvider = Provider((ref) {
  return CryptoUseCase(repository: ref.read(repositoryCryptoProvider));
});
final allCryptoListProvider =
    FutureProvider((ref) => ref.read(getCryptoUseCaseProvider).execute());

final currentPriceGraphicProvider = StateProvider((ref) => Decimal.parse('0'));

final totalUseCaseProvider = StateProvider((ref) =>
    TotalCryptoValueUseCase(repository: ref.watch(repositoryCryptoProvider)));

final getTotalProvider = FutureProvider.family<Decimal, List<double>>(
    (ref, args) => ref.watch(totalUseCaseProvider).totalMoney(args));

final userTotalProvider =
    Provider((ref) => [0.78, 1.54, 3.45, 0.52, 0.45, 1.75]);

class UserTotalNotifier extends StateNotifier<Decimal> {
  UserTotalNotifier()
      : super(
          Decimal.parse('0'),
        );
}

var userTotalCryptoProvider = StateNotifierProvider<UserTotalNotifier, Decimal>(
  (ref) => UserTotalNotifier(),
);
