import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../endPoint/endPoint_provider.dart';
import 'crypto_repository.dart';
import 'market_graphic_repository.dart';

final repositoryCryptoProvider = StateProvider((ref) {
  return CryptoRepository(cryptoEndPoint: ref.read(endpointProvider));
});

final repositoryMarketProvider = StateProvider((ref) {
  return MarketGraphicRepository(
      marketGraphicEndpoint: ref.read(marketEndPointProvider));
});
