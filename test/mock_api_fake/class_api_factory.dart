// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:decimal/decimal.dart';

class ApiFactory {
  final String id;
  final String symbol;
  final String name;
  final String image;
  // ignore: non_constant_identifier_names
  Decimal current_price;
  // ignore: non_constant_identifier_names
  double price_change_percentage_24h;
  ApiFactory({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.current_price,
    required this.price_change_percentage_24h,
  });
}
