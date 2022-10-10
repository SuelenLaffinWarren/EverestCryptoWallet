import 'package:everest_card2_listagem/success/view/sucess_conversion_screen.dart';
import 'package:flutter/material.dart';

class RevisionButton extends StatefulWidget {
  const RevisionButton({
    Key? key,
  }) : super(key: key);

  @override
  State<RevisionButton> createState() => _RevisionButtonState();
}

class _RevisionButtonState extends State<RevisionButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: Colors.white,
      color: const Color.fromARGB(223, 242, 27, 109),
      onPressed: () {
        Navigator.of(context).pushNamed(SucessConversionScreen.route);
      },
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color.fromARGB(223, 244, 9, 107),
        ),
      ),
      child: const Text(
        'Concluir Conversão',
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
