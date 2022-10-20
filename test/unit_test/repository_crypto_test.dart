import 'package:dio/dio.dart';
import 'package:everest_card2_listagem/shared/api/endPoint/crypto_end_point.dart';
import 'package:everest_card2_listagem/shared/api/endPoint/market_end_point.dart';
import 'package:everest_card2_listagem/shared/api/repository/crypto_repository.dart';
import 'package:everest_card2_listagem/shared/api/repository/market_graphic_repository.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocktail/api_factory_datasource.dart';

class CryptoEndpointMock extends Mock implements CryptoEndPoint {}

class MarketEndpointMock extends Mock implements MarketGraphicEndpoint {}

void main() {
  late CryptoEndpointMock cryptoEndpointMock;
  late CryptoRepository cryptoRepository;
  late MarketEndpointMock marketEndpointMock;
  late MarketGraphicRepository marketGraphicRepository;

  setUp(() {
    cryptoEndpointMock = CryptoEndpointMock();
    cryptoRepository = CryptoRepository(cryptoEndPoint: cryptoEndpointMock);
    marketEndpointMock = MarketEndpointMock();
    marketGraphicRepository =
        MarketGraphicRepository(marketGraphicEndpoint: marketEndpointMock);
  });
  test(
      'WHEN getAllCrypto is requested by CryptoEndPoint THEN getAllCrypto from CryptoEndPoint is called ',
      () async {
    when((() => cryptoEndpointMock.getAllCrypto())).thenAnswer((_) async =>
        Response(
            data: ApiFakeModel.getAllCrypto(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await cryptoRepository.getAllCrypto();
    verify(() => cryptoEndpointMock.getAllCrypto()).called(1);
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
