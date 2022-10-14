import 'package:flutter/material.dart';

class RowRevision extends StatefulWidget {
  RowRevision({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);
  String label;
  String value;

  @override
  State<RowRevision> createState() => _RowRevisionState();
}

class _RowRevisionState extends State<RowRevision> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
              fontSize: 19, color: Color.fromARGB(117, 12, 12, 9)),
        ),
        Text(
          widget.value,
          style: const TextStyle(
              fontSize: 19, color: Color.fromARGB(117, 13, 13, 12)),
        ),
      ],
    );
  }
}
