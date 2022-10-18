import 'package:dio/dio.dart';
import 'package:everest_card2_listagem/shared/api/endPoint/crypto_end_point.dart';
import 'package:everest_card2_listagem/shared/api/repository/crypto_repository.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'api_factory_datasource.dart';

class CryptoEndpointMock extends Mock implements CryptoEndPoint {}

void main() {
  late CryptoEndpointMock cryptoEndpointMock;
  late CryptoRepository cryptoRepository;
  setUp(() {
    cryptoEndpointMock = CryptoEndpointMock();
    cryptoRepository = CryptoRepository(cryptoEndPoint: cryptoEndpointMock);
  });
  test(
      'WHEN getAllCharacters is requested by CharacterRepository THEN getAllCharacters from CharactersEndpoint is called ',
      () async {
    when((() => cryptoEndpointMock.getAllCrypto())).thenAnswer((_) async =>
        Response(
            data: ApiFakeModel.getAllCryptosFake(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await cryptoRepository.getAllCrypto();
    verify(() => cryptoEndpointMock.getAllCrypto()).called(1);
  });
}
