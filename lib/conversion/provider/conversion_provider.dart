import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_view_data.dart';

final conversionProvider = StateProvider<CryptoViewData>(
  (ref) => CryptoViewData(
    current_price: Decimal.parse('0'),
    id: '',
    image: '',
    name: '',
    price_change_percentage_24h: 0.00,
    symbol: '',
  ),
);

var conversionPriceProvider = StateProvider((ref) => Decimal.parse('0'));

var boolConversionProvider = StateProvider<bool>((ref) => false);

var totalEstimatedProvider = StateProvider((ref) => 0.00);

var cryptoSymbolProvider = StateProvider((ref) => '');

var textFieldControllerProvider =
    StateProvider((ref) => TextEditingController());

final secondSelectedCryptoProvider = StateProvider<CryptoViewData>((ref) {
  return ref.read(cryptoListProvider).value!.cryptoListViewData.last;
});

final dateNowProvider = StateProvider((ref) => DateTime.now());

final firstSymbolProvider =
    StateProvider<CryptoViewData>((ref) => ref.read(cryptoModelProvider));
