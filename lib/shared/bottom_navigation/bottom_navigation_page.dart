import 'package:flutter/material.dart';

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
          Navigator.pushNamed(
            context,
            '/portfolio',
          );

          break;
        case 1:
          Navigator.pushNamed(context, '/movimentations');
          break;
      }
    }

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/Warren_False.png'),
          activeIcon: Image.asset('assets/images/warrenTrue.png'),
          label: 'Portfólio',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/crypto_false.png'),
          activeIcon: Image.asset('assets/images/Crypto_True.png'),
          label: 'Movimentações',
        ),
      ],
      selectedItemColor: Colors.black,
      currentIndex: selectedIndex,
      onTap: onTap,
    );
  }
}
