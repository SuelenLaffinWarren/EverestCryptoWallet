import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarRevision extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  const AppBarRevision({super.key});

  @override
  ConsumerState<AppBarRevision> createState() => AppBarConvertionState();

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

class AppBarConvertionState extends ConsumerState<AppBarRevision> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Revisar',
        style: TextStyle(
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
