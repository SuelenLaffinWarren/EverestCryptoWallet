// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:decimal/decimal.dart';

class CryptoViewData {
  final String id;
  final String symbol;
  final String name;
  final String image;
  // ignore: non_constant_identifier_names
  Decimal current_price;
  // ignore: non_constant_identifier_names
  double price_change_percentage_24h;

  CryptoViewData({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    // ignore: non_constant_identifier_names
    required this.current_price,
    // ignore: non_constant_identifier_names
    required this.price_change_percentage_24h,
  });

  userValueMoney(Decimal userAmount) {
    return current_price * userAmount;
  }
}
