// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_card2_listagem/shared/provider/crypto_provider.dart';

import '../portfolio/provider/isVisible_provider.dart';
import '../shared/arguments.dart';
import '../shared/models/crypto_model.dart';
import 'widgets/body_crypto_details.dart';

class DetailsCryptoScreen extends StatefulHookConsumerWidget {
  static const route = '/details_crypto_screen';

  const DetailsCryptoScreen({super.key});

  @override
  ConsumerState<DetailsCryptoScreen> createState() =>
      DetailsCryptoScreenState();
}

class DetailsCryptoScreenState extends ConsumerState<DetailsCryptoScreen> {
  @override
  Widget build(BuildContext context) {
    final currentPrice = ref.watch(currentPriceCryptoProvider);
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    CryptoModel crypto = args.cryptoModel;
    ref.read(cryptoModelProvider.notifier).state = crypto;
    ref.read(currentPriceProvider.notifier).state = crypto.currentPriceCrypto;
    var isVisibleState = ref.watch(stateVisible.state);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detalhes',
            style: TextStyle(
                color: Colors.black, fontSize: 21, fontWeight: FontWeight.w700),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(isVisibleState.state
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: () => setState(
                (() => isVisibleState.state = !isVisibleState.state),
              ),
            ),
          ],
        ),
        body: const BodyCryptoDetails(),
      ),
    );
  }
}
