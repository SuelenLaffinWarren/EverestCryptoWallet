import 'package:flutter/material.dart';

import 'button_day_graphic.dart';

class RowButtonsGraphicDays extends StatelessWidget {
  const RowButtonsGraphicDays({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        ButtonDayGraphic(
          daysButton: 5,
          label: '5D',
        ),
        ButtonDayGraphic(
          daysButton: 15,
          label: '15D',
        ),
        ButtonDayGraphic(
          daysButton: 30,
          label: '30D',
        ),
        ButtonDayGraphic(
          daysButton: 45,
          label: '45D',
        ),
        ButtonDayGraphic(
          daysButton: 90,
          label: '90D',
        ),
      ],
    );
  }
}
