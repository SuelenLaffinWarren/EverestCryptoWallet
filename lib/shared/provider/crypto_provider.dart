import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/crypto_model.dart';

final currentValueCryptoWalletProvider = StateProvider((ref) => 00.0);
final quantityProvider = StateProvider((ref) => 00.0);
final abrvCryptoProvider = StateProvider((ref) => '');
final imagePathProvider = StateProvider((ref) => '');
final nameCryptoProvider = StateProvider((ref) => '');
final currentPriceCryptoProvider = StateProvider((ref) => 00.0);
final variationCryptoProvider = StateProvider((ref) => 00.0);
final buttonDaysProvider = StateProvider((ref) => 5);
final variationCryptoButtonProvider = StateProvider((ref) => 0.0);
final daySelectedCryptoProvider = StateProvider((ref) => 5);

class CriptoNotifier extends StateNotifier<CryptoModel> {
  CriptoNotifier()
      : super(
          CryptoModel(
            onTapDetails: () {},
            totalAllWallet: Decimal.parse('1'),
            quantity: Decimal.parse('1'),
            abrvCrypto: '',
            imagePath: '',
            nameCrypto: '',
            currentPriceCrypto: Decimal.parse('1'),
            currentValueCryptoWallet: Decimal.parse('1'),
            variationCrypto: 0.00,
            cryptoValuesY: [Decimal.parse('0')],
          ),
        );
  void variationChange(int time) {
    time = time == 1 ? 2 : time;
    state.variationCrypto = (DecimalFormatter.decimalFormatter(
                state.cryptoValuesY.last) /
            DecimalFormatter.decimalFormatter(state.cryptoValuesY[time - 1]) /
            -1) /
        10;
  }
}

var cryptoModelProvider = StateNotifierProvider<CriptoNotifier, CryptoModel>(
  (ref) => CriptoNotifier(),
);
var currentPriceProvider = StateNotifierProvider<CurrentPriceNotifier, Decimal>(
  (ref) => CurrentPriceNotifier(),
);

class CurrentPriceNotifier extends StateNotifier<Decimal> {
  CurrentPriceNotifier() : super(Decimal.parse('0'));

  void getActualValueCrypto(int days, CryptoModel cripto) {
    state = (cripto.cryptoValuesY[0]);
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
