import '../model/crypto_view_data.dart';
import '../response/crypto_results_response.dart';

extension CryptoMapper on CryptoResultsResponse {
  List<CryptoViewData> toViewData() {
    return results
        .map(
          (result) => CryptoViewData(
              id: result.id,
              symbol: result.symbol,
              name: result.name,
              image: result.image,
              current_price: result.current_price,
              price_change_percentage_24h: result.price_change_percentage_24h),
        )
        .toList();
  }
}
