// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_card2_listagem/crypto_details/utils/providers/crypto_details_providers.dart';

class ButtonDayGraphic extends StatefulHookConsumerWidget {
  ButtonDayGraphic({
    Key? key,
    required this.label,
    required this.days,
  }) : super(key: key);

  late double days;
  final String label;

  @override
  ConsumerState<ButtonDayGraphic> createState() => _ButtonDayGraphicState();
}

class _ButtonDayGraphicState extends ConsumerState<ButtonDayGraphic> {
  List<FlSpot> spotsGraphic = [];

  List<FlSpot> listVariation() {
    if (spotsGraphic.isEmpty) {
      final List<double> y = [];

      var random = Random();
      for (var i = 0; i < 90; i++) {
        y.add(
            double.parse((random.nextDouble() * 103612.60).toStringAsFixed(2)));
      }
      spotsGraphic = y.asMap().entries.map((e) {
        return FlSpot(e.key.toDouble(), e.value);
      }).toList();
    }
    return spotsGraphic;
  }

  List<FlSpot> listVariationChangeDays(double days) {
    List<FlSpot> newSpots = [];

    for (var i = 0; i < days; i++) {
      newSpots.add(spotsGraphic[i]);
    }

    return newSpots;
  }

  FlSpot graphicAtualButtonCrypto() {
    return spotsGraphic[0];
  }

  void cleanGraphic() {
    spotsGraphic = [];
  }

  @override
  Widget build(BuildContext context) {
    final daySelected = ref.watch(daySelectedProvider);
    final double buttonDays = ref.watch(buttonDaysProvider);
    final double cryptoVariation = ref.watch(variationCryptoButtonProvider);
    return SizedBox(
      height: 35,
      width: 60,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              widget.days == daySelected ? Colors.grey.shade300 : null),
        ),
        onPressed: () {
          listVariationChangeDays(
              ref.watch(buttonDaysProvider.state).state = widget.days);
          print(widget.days);
          if (widget.days / 10 > cryptoVariation) {
            ref.watch(variationCryptoButtonProvider.state).state =
                ((widget.days / 10) + cryptoVariation);
          } else {
            ref.watch(variationCryptoButtonProvider.state).state =
                ((widget.days / 10) - cryptoVariation);
          }
          setState(() {});
        },
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
