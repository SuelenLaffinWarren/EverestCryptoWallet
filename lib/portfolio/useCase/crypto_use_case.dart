// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:everest_card2_listagem/portfolio/mapper/crypto_mapper.dart';
import 'package:everest_card2_listagem/shared/api/repository/crypto_repository.dart';

import '../model/crypto_view_data.dart';

class CryptoUseCase {
  final CryptoRepository repository;
  CryptoUseCase({
    required this.repository,
  });

  Future<List<CryptoViewData>> execute() async {
    final response = await repository.getAllCrypto();
    return response.toViewData();
  }
}