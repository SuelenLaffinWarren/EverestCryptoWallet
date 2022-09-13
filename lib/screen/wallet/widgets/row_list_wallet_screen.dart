import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/provider/providers.dart';
import 'row_wallet_screen.dart';

class RowListWallet extends StatefulHookConsumerWidget {
  const RowListWallet({
    Key? key,
    required this.isVisibleState,
    required this.totalCrypto,
    required this.btcValue,
    required this.quantityBtc,
    required this.abrvBtc,
    required this.ethValue,
    required this.quantityEth,
    required this.abrvEth,
    required this.ltcValue,
    required this.quantityLtc,
    required this.abrvLtc,
  }) : super(key: key);

  final StateController<bool> isVisibleState;
  final Decimal totalCrypto;
  final Decimal btcValue;
  final double quantityBtc;
  final String abrvBtc;
  final Decimal ethValue;
  final double quantityEth;
  final String abrvEth;
  final Decimal ltcValue;
  final double quantityLtc;
  final String abrvLtc;

  @override
  ConsumerState<RowListWallet> createState() => _RowListWalletState();
}

class _RowListWalletState extends ConsumerState<RowListWallet> {
  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(visibilityProvider.state);
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        const Divider(
          thickness: 1,
        ),
        RowCryptoScreen(
          value: widget.btcValue,
          quantityCrypto: '${widget.quantityBtc}',
          imageCrypto: 'assets/images/bitcoin.png',
          nameCrypto: 'Bitcoin',
          abrevNameCrypto: widget.abrvBtc,
        ),
        const Divider(
          thickness: 1,
        ),
        RowCryptoScreen(
          value: widget.ethValue,
          quantityCrypto: '${widget.quantityEth}',
          imageCrypto: 'assets/images/ETH.png',
          nameCrypto: 'Ethereum',
          abrevNameCrypto: widget.abrvEth,
        ),
        const Divider(
          thickness: 1,
        ),
        RowCryptoScreen(
          value: widget.ltcValue,
          quantityCrypto: '${widget.quantityLtc}',
          imageCrypto: 'assets/images/LTC.png',
          nameCrypto: 'Litecoin',
          abrevNameCrypto: widget.abrvLtc,
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
