// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'crypto_response.g.dart';

@JsonSerializable()
class CryptoResponse {
  String id;
  String symbol;
  String name;
  String image;
  double current_price;
  double price_change_percentage_24h;

  CryptoResponse(
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.current_price,
    this.price_change_percentage_24h,
  );

  factory CryptoResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoResponseFromJson(json);

  Map<dynamic, dynamic> toJson() => _$CryptoResponseToJson(this);
}
