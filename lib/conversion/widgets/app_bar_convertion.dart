import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../crypto_details/providers_details/providers_details.dart';

class AppBarConvertion extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  const AppBarConvertion({super.key});

  @override
  ConsumerState<AppBarConvertion> createState() => AppBarConvertionState();

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

class AppBarConvertionState extends ConsumerState<AppBarConvertion> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Converter',
        style: TextStyle(
            color: Colors.black, fontSize: 21, fontWeight: FontWeight.w700),
      ),
      leading: IconButton(
          onPressed: () {
            ref.watch(buttonDaysProvider.state).state;
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back)),
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
    );
  }
}
