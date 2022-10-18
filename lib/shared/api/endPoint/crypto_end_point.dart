// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:everest_card2_listagem/shared/utils/api_utils.dart';

class CryptoEndPoint {
  final Dio _dio;
  CryptoEndPoint(
    this._dio,
  );

  Future<Response> getAllCrypto() {
    return _dio.get(getApi, queryParameters: {
      'ids': 'bitcoin,litecoin,ethereum,dogecoin,solana,tether',
      'vs_currency': 'usd',
    });
  }
}
