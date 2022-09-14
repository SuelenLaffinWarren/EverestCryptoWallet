import 'package:decimal/decimal.dart';
import 'info_title_wallet_column_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'row_list_wallet_screen.dart';

class PortfolioScreen extends StatefulHookConsumerWidget {
  const PortfolioScreen({
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
  ConsumerState<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends ConsumerState<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: InfoTitleColumnWallet(
              isVisibleState: widget.isVisibleState.state,
              totalCrypto: widget.totalCrypto),
        ),
        RowListWallet(
            isVisibleState: widget.isVisibleState,
            totalCrypto: widget.totalCrypto,
            btcValue: widget.btcValue,
            quantityBtc: widget.quantityBtc,
            abrvBtc: widget.abrvBtc,
            ethValue: widget.ethValue,
            quantityEth: widget.quantityEth,
            abrvEth: widget.abrvEth,
            ltcValue: widget.ltcValue,
            quantityLtc: widget.quantityLtc,
            abrvLtc: widget.abrvLtc),
      ],
    );
  }
}
