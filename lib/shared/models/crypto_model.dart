// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/animation.dart';

class CryptoModel {
  final VoidCallback onTapDetails;
  final double totalAllWallet;
  final double quantity;
  final String abrvCrypto;
  final String imagePath;
  final String nameCrypto;
  final double currentPriceCrypto;
  final double currentValueCryptoWallet;
  final double variationCrypto;
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
  });
}
