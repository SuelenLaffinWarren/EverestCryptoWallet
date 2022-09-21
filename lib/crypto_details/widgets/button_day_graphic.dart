// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/provider/crypto_provider.dart';

class ButtonDayGraphic extends StatefulHookConsumerWidget {
  const ButtonDayGraphic({
    Key? key,
    required this.label,
    required this.daysButton,
  }) : super(key: key);

  final int daysButton;
  final String label;

  @override
  ConsumerState<ButtonDayGraphic> createState() => _ButtonDayGraphicState();
}

class _ButtonDayGraphicState extends ConsumerState<ButtonDayGraphic> {
  @override
  Widget build(BuildContext context) {
    final days = ref.watch(buttonDaysProvider.state);
    final cryptoOne = ref.watch(cryptoModelProvider.notifier).state;

    return SizedBox(
      height: 30,
      width: 50,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              widget.daysButton == days.state
                  ? const Color.fromRGBO(238, 240, 247, 1)
                  : null),
        ),
        onPressed: () {
          setState(() {
            days.state = widget.daysButton;
            ref
                .read(cryptoModelProvider.notifier)
                .variationChange(widget.daysButton);
            ref
                .read(currentPriceProvider.notifier)
                .getActualValueCrypto(widget.daysButton, cryptoOne);
            cryptoOne.currentPriceCrypto =
                ref.read(currentPriceProvider.notifier).state;
            cryptoOne.variationCrypto =
                ref.read(cryptoModelProvider.notifier).state.variationCrypto;
          });
        },
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: days.state == widget.daysButton
                ? Colors.black
                : const Color.fromRGBO(117, 118, 128, 1),
            fontWeight: FontWeight.w800,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
