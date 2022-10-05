// ignore_for_file: public_member_api_docs, sort_constructors_first

import '/shared/api/endPoint/crypto_end_point.dart';
import '../response/crypto_response.dart';

class CryptoRepository {
  final CryptoEndPoint cryptoEndPoint;
  CryptoRepository({
    required this.cryptoEndPoint,
  });

  Future<List<CryptoResponse>> getAllCrypto() async {
    final result = await cryptoEndPoint.getAllCrypto();

    return List<CryptoResponse>.from(
      result.data.map((item) => CryptoResponse.fromJson(item)),
    );
  }
}
