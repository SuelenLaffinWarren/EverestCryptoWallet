import 'package:flutter/material.dart';

class RowProofMovimentations extends StatefulWidget {
  RowProofMovimentations({Key? key, required this.label1, required this.label2})
      : super(key: key);

  String label1;
  String label2;
  @override
  State<RowProofMovimentations> createState() => _RowProofMovimentationsState();
}

class _RowProofMovimentationsState extends State<RowProofMovimentations> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label1,
          style: const TextStyle(fontSize: 20, color: Colors.pink),
        ),
        Text(widget.label2, style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}
