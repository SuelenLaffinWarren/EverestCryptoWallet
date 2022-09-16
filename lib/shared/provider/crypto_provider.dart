import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final totalCryptoProvider = StateProvider((ref) => 00.0);
final quantityProvider = StateProvider((ref) => 00.0);
final abrvCryptoProvider = StateProvider((ref) => '');
final imagePathProvider = StateProvider((ref) => '');
final nameCryptoProvider = StateProvider((ref) => '');
final currentPriceCryptoProvider = StateProvider((ref) => 00.0);
final variationCryptoProvider = StateProvider((ref) => 00.0);
final totalAllWalletProvider = StateProvider((ref) => 00.0);
final graphicLoadedProvider = ValueNotifier((ref) => false);
