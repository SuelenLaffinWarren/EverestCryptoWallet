import 'package:everest_card2_listagem/crypto_details/useCase/market_use_case.dart';
import 'package:everest_card2_listagem/portfolio/useCase/crypto_use_case.dart';
import 'package:everest_card2_listagem/shared/api/repository/crypto_repository.dart';
import 'package:everest_card2_listagem/shared/api/repository/market_graphic_repository.dart';
import 'package:everest_card2_listagem/shared/api/response/crypto_response.dart';
import 'package:everest_card2_listagem/shared/api/response/market_graphic_response.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CryptoRepositoryMock extends Mock implements CryptoRepository {}

class MarketRepositoryMock extends Mock implements MarketGraphicRepository {}

void main() {
  late CryptoRepositoryMock cryptoRepositoryMock;
  late CryptoUseCase cryptoUseCase;
  late MarketRepositoryMock marketRepositoryMock;
  late MarketUseCase marketUseCase;

  setUp(() {
    cryptoRepositoryMock = CryptoRepositoryMock();
    cryptoUseCase = CryptoUseCase(repository: cryptoRepositoryMock);
    marketRepositoryMock = MarketRepositoryMock();
    marketUseCase = MarketUseCase(repository: marketRepositoryMock);
  });
  test(
      'WHEN the gelAllCrypto is requested by CryptoUseCase THEN getAllCrypto from CryptoUseCase is called ',
      () async {
    when((() => cryptoRepositoryMock.getAllCrypto())).thenAnswer(
      (invocation) async => [
        CryptoResponse(
            faker.lorem.word(),
            faker.lorem.word(),
            faker.lorem.word(),
            faker.image.image(),
            faker.randomGenerator.decimal(scale: 100),
            faker.randomGenerator.integer(10).toDouble())
      ],
    );
    await cryptoUseCase.execute();
  });
  test(
      'WHEN the getMarketGraphicCrypto is requested by MarketUseCase THEN getMarketGraphicCrypto from MarketUseCase is called ',
      () async {
    when((() => marketRepositoryMock.getMarketGraphicCrypto('bitcoin')))
        .thenAnswer((invocation) async => MarketGraphicResponse([
              [Faker().randomGenerator.integer(100)]
            ]));

    await marketUseCase.execute('bitcoin');
  });
}
