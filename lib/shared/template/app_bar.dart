import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarTemplate extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  AppBarTemplate({super.key, required this.title});
  String title;

  @override
  ConsumerState<AppBarTemplate> createState() => AppBarConvertionState();

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

class AppBarConvertionState extends ConsumerState<AppBarTemplate> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(
            color: Colors.black, fontSize: 21, fontWeight: FontWeight.w700),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back)),
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
    );
  }
}
