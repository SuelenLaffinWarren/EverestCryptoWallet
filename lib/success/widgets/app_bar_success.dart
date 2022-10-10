import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarSuccess extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  const AppBarSuccess({super.key});

  @override
  ConsumerState<AppBarSuccess> createState() => AppBarConvertionState();

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

class AppBarConvertionState extends ConsumerState<AppBarSuccess> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
