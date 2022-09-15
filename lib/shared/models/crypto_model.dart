// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';

class CryptoModel {
  final Decimal totalCrypto;
  final double quantity;
  final String abrvCrypto;
  final String imagePath;
  final String nameCrypto;
  final Decimal currentePriceCrypto;
  CryptoModel({
    required this.totalCrypto,
    required this.quantity,
    required this.abrvCrypto,
    required this.imagePath,
    required this.nameCrypto,
    required this.currentePriceCrypto,
  });
}
