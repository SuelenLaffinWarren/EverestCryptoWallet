// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/shared/api/mapper/crypto_mapper.dart';
import 'package:everest_card2_listagem/shared/api/model/crypto_view_data.dart';
import 'package:everest_card2_listagem/shared/api/repository/crypto_repository.dart';

class TotalCryptoValueUseCase {
  CryptoRepository repository;
  TotalCryptoValueUseCase({
    required this.repository,
  });

  Future<Decimal> totalMoney(List<double> userTotalValue) async {
    var response = await repository.getAllCrypto();
    Decimal total = Decimal.parse('0');
    List<CryptoViewData> valuesCrypto = response.toViewData();
    for (var i = 0; i < userTotalValue.length; i++) {
      total += Decimal.parse(userTotalValue[i].toString()) *
          Decimal.parse(valuesCrypto[i].current_price.toString());
    }
    return total;
  }
}
