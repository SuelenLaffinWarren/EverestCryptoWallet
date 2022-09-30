// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_graphic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketGraphicResponse _$MarketGraphicResponseFromJson(
        Map<String, dynamic> json) =>
    MarketGraphicResponse(
      (json['prices'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
    );

Map<String, dynamic> _$MarketGraphicResponseToJson(
        MarketGraphicResponse instance) =>
    <String, dynamic>{
      'values': instance.prices,
    };
