// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/provider/crypto_provider.dart';
import '../providers_details/providers_details.dart';

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
    final crypto = ref.watch(cryptoModelProvider.notifier).state;

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
            crypto.current_price =
                ref.read(currentPriceProvider.notifier).state;
            ref
                .read(currentPriceProvider.notifier)
                .getActualValueCrypto(widget.daysButton, crypto);

            ref.read(cryptoModelProvider.notifier).variationChange(
                  widget.daysButton,
                );
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
