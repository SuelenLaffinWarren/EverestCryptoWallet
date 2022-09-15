import 'package:flutter/material.dart';

class BottomNavigationWallet extends StatelessWidget {
  const BottomNavigationWallet({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
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
        onTap: onTap);
  }
}
