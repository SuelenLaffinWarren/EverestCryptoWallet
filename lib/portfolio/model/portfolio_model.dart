// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';

class PortfolioModel {
  Decimal userValueCrypto;
  double quantityUserCrypto;
  PortfolioModel({
    required this.userValueCrypto,
    required this.quantityUserCrypto,
  });
}
