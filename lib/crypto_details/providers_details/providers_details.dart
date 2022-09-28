import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/market_graphic_view_data.dart';
import '../../shared/api/repository/repository_provider.dart';
import '../useCase/market_use_case.dart';

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

final buttonDaysProvider = StateProvider((ref) => 5);
final variationCryptoButtonProvider = StateProvider((ref) => 0.0);
final daySelectedCryptoProvider = StateProvider((ref) => 5.00);
