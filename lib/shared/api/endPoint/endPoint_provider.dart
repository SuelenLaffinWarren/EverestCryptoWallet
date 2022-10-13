import 'package:dio/dio.dart';
import '../../utils/api_utils.dart';
import 'market_end_point.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'crypto_end_point.dart';

final dioProvider = StateProvider((ref) => Dio());

final endpointProvider = Provider((ref) {
  final dio = Dio(BaseOptions(baseUrl: baseUrlApi));
  return CryptoEndPoint(dio);
});

final marketEndPointProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  return MarketGraphicEndpoint(dio: dio);
});
