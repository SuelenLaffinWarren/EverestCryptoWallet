import 'package:dio/dio.dart';
import 'package:everest_card2_listagem/shared/api/endPoint/market_end_point.dart';
import 'package:everest_card2_listagem/shared/api/repository/market_graphic_repository.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocktail/api_factory_datasource.dart';

class MarketEndpointMock extends Mock implements MarketGraphicEndpoint {}

void main() {
  late MarketEndpointMock marketEndpointMock;
  late MarketGraphicRepository marketGraphicRepository;

  setUp(() {
    marketEndpointMock = MarketEndpointMock();
    marketGraphicRepository =
        MarketGraphicRepository(marketGraphicEndpoint: marketEndpointMock);
  });

  test(
      'WHEN getMarketGraphicCrypto is requested by MarketEndPoint THEN getMarketGraphicCrypto from MarketEndPoint is called ',
      () async {
    when((() => marketEndpointMock.getCryptoMarketChart('bitcoin'))).thenAnswer(
        (_) async => Response(
            data: ApiFakeModel.getCryptoMarketChart(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await marketGraphicRepository.getMarketGraphicCrypto('bitcoin');
    verify(() => marketEndpointMock.getCryptoMarketChart('bitcoin')).called(1);
  });
}
