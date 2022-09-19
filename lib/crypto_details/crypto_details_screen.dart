// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brasil_fields/brasil_fields.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_card2_listagem/shared/provider/crypto_provider.dart';

import '../dataSource/crypto_datasource.dart';

import 'utils/providers/crypto_details_providers.dart';
import 'widgets/button_day_graphic.dart';
import 'widgets/graphic_details_screen.dart';
import 'widgets/graphic_points.dart';

class DetailsCryptoScreen extends StatefulHookConsumerWidget {
  @override
  ConsumerState<DetailsCryptoScreen> createState() =>
      _DetailsCryptoScreenState();
}

class _DetailsCryptoScreenState extends ConsumerState<DetailsCryptoScreen> {
  final getAllCrypto = CryptoDatasource();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String nameCrypto = ref.watch(nameCryptoProvider);
    final String abrvCrypto = ref.watch(abrvCryptoProvider);
    final String imagePath = ref.watch(imagePathProvider);

    final double currentValueCryptoWallet =
        ref.watch(currentValueCryptoWalletProvider);
    final double currentPriceCrypto = ref.watch(currentPriceCryptoProvider);
    final double variationCrypto = ref.watch(variationCryptoButtonProvider);
    final double quantityCrypto = ref.watch(quantityProvider);
    final double buttonDays = ref.watch(buttonDaysProvider);
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
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              width: 300,
              height: 100,
              child: GraphicDetailsScreen(
                points: listVariation(),
                days: buttonDays,
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ButtonDayGraphic(
                days: 5,
                label: '5D',
              ),
              ButtonDayGraphic(
                days: 15,
                label: '15D',
              ),
              ButtonDayGraphic(
                days: 30,
                label: '30D',
              ),
              ButtonDayGraphic(
                days: 45,
                label: '45D',
              ),
              ButtonDayGraphic(
                days: 90,
                label: '90D',
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                const Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Preço atual'),
                          Text(
                            UtilBrasilFields.obterReal(currentPriceCrypto),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Variação 24H'),
                          Text(
                            '$variationCrypto',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Quantidade'),
                          Text(
                            '$quantityCrypto',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Valor'),
                          Text(
                            UtilBrasilFields.obterReal(
                                currentValueCryptoWallet),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: 400,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(224, 43, 87, 1),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: const Text('Converter moeda'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
