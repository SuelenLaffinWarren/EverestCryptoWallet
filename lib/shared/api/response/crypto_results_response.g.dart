// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_results_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoResultsResponse _$CryptoResultsResponseFromJson(
        Map<String, dynamic> json) =>
    CryptoResultsResponse(
      (json['results'] as List<dynamic>)
          .map((e) => CryptoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CryptoResultsResponseToJson(
        CryptoResultsResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
