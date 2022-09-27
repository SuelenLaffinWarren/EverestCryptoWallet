// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:everest_card2_listagem/shared/api/mapper/market_mapper.dart';
import 'package:everest_card2_listagem/shared/api/model/market_graphic_view_data.dart';
import 'package:everest_card2_listagem/shared/api/repository/market_graphic_repository.dart';

class MarketUseCase {
  final MarketGraphicRepository repository;
  MarketUseCase({
    required this.repository,
  });

  Future<MarketGraphicViewData> execute(crypto) async {
    final response = await repository.getMarketGraphicCrypto(crypto);
    return response.toViewMarkerGraphic();
  }
}
