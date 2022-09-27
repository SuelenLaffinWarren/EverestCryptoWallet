import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market_graphic_response.g.dart';

@JsonSerializable()
class MarketGraphicResponse {
  final List<Decimal> prices;
  MarketGraphicResponse({
    required this.prices,
  });

  factory MarketGraphicResponse.fromJson(Map<dynamic, dynamic> json) =>
      _$MarketGraphicResponseFromJson(json);

  Map<dynamic, dynamic> toJson() => _$MarketGraphicResponseToJson(this);
}
