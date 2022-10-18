import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationWallet extends StatelessWidget {
  const BottomNavigationWallet({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    void onTap(index) {
      switch (index) {
        case 0:
          Navigator.of(context).pushNamed('/portfolio');

          break;
        case 1:
          Navigator.of(context).pushNamed('/movimentations');
          break;
      }
    }

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/Warren_False.png'),
          activeIcon: Image.asset('assets/images/warrenTrue.png'),
          label: AppLocalizations.of(context)!.portfolio,
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/crypto_false.png'),
          activeIcon: Image.asset('assets/images/Crypto_True.png'),
          label: AppLocalizations.of(context)!.movimentations,
        ),
      ],
      selectedItemColor: Colors.black,
      currentIndex: selectedIndex,
      onTap: onTap,
    );
  }
}
