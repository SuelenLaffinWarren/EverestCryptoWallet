// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';

class MovimentationsModel {
  DateTime dateNow;
  String firstSymbol;
  String secondCrypto;
  String controller;
  Decimal convertPrice;
  double totalEstimated;
  MovimentationsModel({
    required this.dateNow,
    required this.firstSymbol,
    required this.secondCrypto,
    required this.controller,
    required this.convertPrice,
    required this.totalEstimated,
  });
}
