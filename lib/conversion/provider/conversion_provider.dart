import 'package:decimal/decimal.dart';
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

var conversionPriceProvider = StateProvider((ref) => 0.0);
var boolConversionProvider = StateProvider<bool>((ref) => false);

var cryptoSymbolProvider = StateProvider((ref) => '');
var textFieldControllerProvider =
    StateProvider((ref) => TextEditingController());
