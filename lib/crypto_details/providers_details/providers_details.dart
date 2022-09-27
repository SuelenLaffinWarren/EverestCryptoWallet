import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/api/model/market_graphic_view_data.dart';
import '../../shared/api/repository/repository_provider.dart';
import '../../shared/api/useCase/market_use_case.dart';

final getMarketChartDataProvider = Provider((ref) {
  return MarketUseCase(
    repository: ref.read(repositoryMarketProvider),
  );
});

final marketGraphicDataProvider =
    FutureProvider.family<MarketGraphicViewData, dynamic>(
  ((ref, crypto) async {
    return await ref.read(getMarketChartDataProvider).execute(crypto);
  }),
);
