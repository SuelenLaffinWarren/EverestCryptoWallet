import 'package:dio/dio.dart';

class MarketGraphicEndpoint {
  final Dio dio;

  MarketGraphicEndpoint({required this.dio});

  Future<Response> getCryptoMarketChart(String crypto) {
    return dio.get(
        'https://api.coingecko.com/api/v3/coins/${crypto.toLowerCase()}/market_chart?vs_currency=brl&days=365&interval=daily');
  }
}
