// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/crypto_details/providers_details/providers_details.dart';
import 'package:everest_card2_listagem/portfolio/model/crypto_view_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../widgets/body_crypto_details.dart';

class DetailsCryptoScreen extends StatefulHookConsumerWidget {
  DetailsCryptoScreen({Key? key, required this.crypto, required this.userValue})
      : super(key: key);
  CryptoViewData crypto;
  Decimal userValue;
  static const route = '/details_crypto_screen';

  @override
  ConsumerState<DetailsCryptoScreen> createState() =>
      DetailsCryptoScreenState();
}

class DetailsCryptoScreenState extends ConsumerState<DetailsCryptoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.details,
            style: const TextStyle(
                color: Colors.black, fontSize: 21, fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
              onPressed: () {
                ref.watch(buttonDaysProvider.state).state;
                Navigator.of(context).pushNamed('/portfolio');
              },
              icon: const Icon(Icons.arrow_back)),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: BodyCryptoDetails(
          crypto: widget.crypto,
          userValue: widget.userValue,
        ),
      ),
    );
  }
}
