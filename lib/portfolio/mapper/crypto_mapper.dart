import 'package:decimal/decimal.dart';

import '../../shared/api/response/crypto_response.dart';
import '../model/crypto_list_view_data.dart';
import '../model/crypto_view_data.dart';

extension CryptoMapper on List<CryptoResponse> {
  CryptoListViewData toViewData() {
    return CryptoListViewData(
      cryptoListViewData: map(
        (crypto) {
          return CryptoViewData(
            id: crypto.id,
            symbol: crypto.symbol,
            name: crypto.name,
            image: crypto.image,
            current_price: Decimal.parse('${crypto.current_price}'),
            price_change_percentage_24h: crypto.price_change_percentage_24h,
          );
        },
      ).toList(),
    );
  }
}
