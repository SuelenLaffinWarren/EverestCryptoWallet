// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_card2_listagem/shared/provider/crypto_provider.dart';

import '../dataSource/crypto_datasource.dart';

class DetailsCryptoScreen extends StatefulHookConsumerWidget {
  @override
  ConsumerState<DetailsCryptoScreen> createState() =>
      _DetailsCryptoScreenState();
}

class _DetailsCryptoScreenState extends ConsumerState<DetailsCryptoScreen> {
  final getAllCrypto = CryptoDatasource();

  @override
  Widget build(BuildContext context) {
    final String nameCrypto = ref.watch(nameCryptoProvider);
    final String abrvCrypto = ref.watch(abrvCryptoProvider);
    final String imagePath = ref.watch(imagePathProvider);
    final double totalAllWallet = ref.watch(totalAllWalletProvider);
    final double totalCrypto = ref.watch(totalCryptoProvider);
    final double currentPriceCrypto = ref.watch(currentPriceCryptoProvider);
    final double variationCrypto = ref.watch(variationCryptoProvider);
    final cryptoList = getAllCrypto.getAllCrypto();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Detalhes',
          style: TextStyle(
              color: Colors.black, fontSize: 21, fontWeight: FontWeight.w700),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 16, left: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameCrypto,
                      style: const TextStyle(
                          fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      abrvCrypto,
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: Image.asset(
                    imagePath,
                    width: 48,
                    height: 48,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              UtilBrasilFields.obterReal(currentPriceCrypto),
              style: const TextStyle(
                  fontSize: 32,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListView.builder(
            itemCount: cryptoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    const Text('Preço atual'),
                    Text(
                      UtilBrasilFields.obterReal(currentPriceCrypto),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
