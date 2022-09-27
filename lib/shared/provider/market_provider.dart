import '../api/repository/repository_provider.dart';
import '../api/useCase/market_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getMarketGraphicProvider = Provider((ref) {
  return MarketUseCase(repository: ref.read(repositoryMarketProvider));
});

final marketGraphicProvider = FutureProvider((ref) async {
  return await ref.read(getMarketGraphicProvider);
});
