import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavigationBarWalletCrypto extends StatefulHookConsumerWidget {
  const BottomNavigationBarWalletCrypto({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BottomNavigationBarWalletCrypto> createState() =>
      _BottomNavigationBarWalletCryptoState();
}

class _BottomNavigationBarWalletCryptoState
    extends ConsumerState<BottomNavigationBarWalletCrypto> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      Navigator.of(context).pushReplacementNamed('/movimentations_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Warren_False.png'),
            activeIcon: Image.asset('assets/images/warrenTrue.png'),
            label: 'Portifólio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/crypto_false.png'),
            activeIcon: Image.asset('assets/images/Crypto_True.png'),
            label: 'Movimentações',
          ),
        ],
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped);
  }
}
