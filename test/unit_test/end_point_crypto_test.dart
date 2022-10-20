import 'package:dio/dio.dart';
import 'package:everest_card2_listagem/shared/api/endPoint/crypto_end_point.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocktail/api_factory_datasource.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Response<List<Map<String, dynamic>>> sucess;
  late DioMock dioMock;
  late CryptoEndPoint cryptoEndPoint;

  When mockGetResponse() => when(
      () => dioMock.get(any(), queryParameters: any(named: 'queryParameters')));

  mockResponse(List<Map<String, dynamic>> factory, int statusCode) => Response(
      data: factory,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: faker.internet.httpUrl()));

  setUp(() {
    dioMock = DioMock();
    cryptoEndPoint = CryptoEndPoint(dioMock);
  });

  setUp(() {
    sucess = mockResponse(ApiFakeModel.getAllCrypto(), 200);
  });
  test('WHEN getAllCryptos is requested THEN returns 200', (() async {
    mockGetResponse().thenAnswer((_) async => sucess);
    final result = await cryptoEndPoint.getAllCrypto();
    expect(result.statusCode, equals(200));
    expect(result, sucess);
  }));
}
