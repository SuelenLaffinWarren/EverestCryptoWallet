import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/movimentations/model/movimentations_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_view_data.dart';

final movimentationListProvider =
    StateProvider<List<MovimentationsModel>>((ref) => []);

final movimentationProvider = StateProvider<CryptoViewData>(
  (ref) => CryptoViewData(
    current_price: Decimal.parse('0'),
    id: '',
    image: '',
    name: '',
    price_change_percentage_24h: 0.00,
    symbol: '',
  ),
);
