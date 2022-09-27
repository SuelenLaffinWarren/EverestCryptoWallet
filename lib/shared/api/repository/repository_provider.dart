import '../endPoint/endPoint_provider.dart';
import 'crypto_repository.dart';
import 'market_graphic_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final repositoryCryptoProvider = Provider((ref) {
  return CryptoRepository(cryptoEndPoint: ref.read(endpointProvider));
});

final repositoryMarketProvider = Provider((ref) {
  return MarketGraphicRepository(
      marketGraphicEndpoint: ref.read(marketEndPointProvider));
});
