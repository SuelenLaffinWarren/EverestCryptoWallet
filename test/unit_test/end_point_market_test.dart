import 'package:dio/dio.dart';
import 'package:everest_card2_listagem/shared/api/endPoint/market_end_point.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocktail/api_factory_datasource.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Response<Map<String, dynamic>> sucess;
  late DioMock dioMock;

  late MarketGraphicEndpoint marketGraphicEndpoint;

  When mockGetResponse() => when(
      () => dioMock.get(any(), queryParameters: any(named: 'queryParameters')));

  mockResponse(Map<String, dynamic> factory, int statusCode) => Response(
      data: factory,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: faker.internet.httpUrl()));

  setUp(() {
    dioMock = DioMock();

    marketGraphicEndpoint = MarketGraphicEndpoint(dio: dioMock);
  });

  setUp(() {
    sucess = mockResponse(ApiFakeModel.getCryptoMarketChart(), 200);
  });

  test('WHEN getCryptoMarketChart is requested THEN returns 200', (() async {
    mockGetResponse().thenAnswer((_) async => sucess);
    final result = await marketGraphicEndpoint.getCryptoMarketChart('bitcoin');
    expect(result.statusCode, equals(200));
    expect(result, sucess);
  }));
}
