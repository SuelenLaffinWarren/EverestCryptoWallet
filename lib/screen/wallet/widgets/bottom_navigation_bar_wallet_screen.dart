import 'package:flutter/material.dart';

class BottomNavigationBarWalletCrypto extends StatelessWidget {
  const BottomNavigationBarWalletCrypto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/warrenTrue.png'),
          label: 'Portifólio',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/crypto_false.png'),
          label: 'Movimentações',
        ),
      ],
      selectedItemColor: Colors.black,
    );
  }
}
