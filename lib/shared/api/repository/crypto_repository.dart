// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:everest_card2_listagem/shared/api/response/crypto_results_response.dart';

import '/shared/api/endPoint/crypto_end_point.dart';

import '../response/crypto_response.dart';

class CryptoRepository {
  final CryptoEndPoint cryptoEndPoint;
  CryptoRepository({
    required this.cryptoEndPoint,
  });

  Future<CryptoResultsResponse> getAllCrypto() async {
    final result = await cryptoEndPoint.getAllCrypto();

    return CryptoResultsResponse(List.from(
      result.data.map((item) => CryptoResponse.fromJson(item)),
    ));
  }
}
