import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BodySuccess extends StatelessWidget {
  const BodySuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/lottie/check.json', width: 200, height: 200),
        const Text(
          'Conversão efetuada',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text('Conversão de moeda efetuada com sucesso!',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey)),
      ],
    );
  }
}
