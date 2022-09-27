// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'crypto_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_results_response.g.dart';

@JsonSerializable()
class CryptoResultsResponse {
  final List<CryptoResponse> results;
  CryptoResultsResponse(
    this.results,
  );

  factory CryptoResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoResultsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoResultsResponseToJson(this);
}
