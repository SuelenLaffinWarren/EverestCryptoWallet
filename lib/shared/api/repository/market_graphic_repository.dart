// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:everest_card2_listagem/shared/api/endPoint/market_end_point.dart';
import 'package:everest_card2_listagem/shared/api/response/market_graphic_response.dart';

class MarketGraphicRepository {
  final MarketGraphicEndpoint marketGraphicEndpoint;
  MarketGraphicRepository({
    required this.marketGraphicEndpoint,
  });

  Future<MarketGraphicResponse> getMarketGraphicCrypto(crypto) async {
    final response = await marketGraphicEndpoint.getCryptoMarketChart(crypto);

    return MarketGraphicResponse.fromJson(response.data);
  }
}
