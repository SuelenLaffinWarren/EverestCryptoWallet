// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:everest_card2_listagem/crypto_details/providers_details/providers_details.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';

import '../../portfolio/provider/isVisible_provider.dart';
import '../widgets/body_crypto_details.dart';

class DetailsCryptoScreen extends StatefulHookConsumerWidget {
  static const route = '/details_crypto_screen';

  const DetailsCryptoScreen({
    required this.crypto,
  });
  final CryptoViewData crypto;

  @override
  ConsumerState<DetailsCryptoScreen> createState() =>
      DetailsCryptoScreenState();
}

class DetailsCryptoScreenState extends ConsumerState<DetailsCryptoScreen> {
  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(stateVisible.state);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detalhes',
            style: TextStyle(
                color: Colors.black, fontSize: 21, fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
              onPressed: () {
                ref.watch(buttonDaysProvider.state).state;
                Navigator.pushNamed(context, '/portfolio');
              },
              icon: const Icon(Icons.arrow_back)),
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
        body: BodyCryptoDetails(
          crypto: widget.crypto,
        ),
      ),
    );
  }
}
