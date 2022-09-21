// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';
import 'package:flutter/animation.dart';

class CryptoModel {
  VoidCallback onTapDetails;
  Decimal totalAllWallet;
  Decimal quantity;
  String abrvCrypto;
  String imagePath;
  String nameCrypto;
  Decimal currentPriceCrypto;
  Decimal currentValueCryptoWallet;
  double variationCrypto;
  List<Decimal> cryptoValuesY;
  CryptoModel({
    required this.onTapDetails,
    required this.totalAllWallet,
    required this.quantity,
    required this.abrvCrypto,
    required this.imagePath,
    required this.nameCrypto,
    required this.currentPriceCrypto,
    required this.currentValueCryptoWallet,
    required this.variationCrypto,
    required this.cryptoValuesY,
  });
}
