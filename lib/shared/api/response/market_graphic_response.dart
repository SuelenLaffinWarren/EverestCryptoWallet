import 'package:json_annotation/json_annotation.dart';

part 'market_graphic_response.g.dart';

@JsonSerializable()
class MarketGraphicResponse {
  final List<List<num>> prices;
  MarketGraphicResponse(
    this.prices,
  );

  factory MarketGraphicResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketGraphicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketGraphicResponseToJson(this);
}
