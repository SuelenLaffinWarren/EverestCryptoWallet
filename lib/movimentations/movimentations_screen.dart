import 'package:flutter/material.dart';

class MovimentationsScreen extends StatefulWidget {
  const MovimentationsScreen({Key? key}) : super(key: key);

  @override
  State<MovimentationsScreen> createState() => _MovimentationsScreenState();
}

class _MovimentationsScreenState extends State<MovimentationsScreen> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.of(context).pushReplacementNamed('/wallet_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Página em construção'),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        onTap: _onItemTapped,
      ),
    );
  }
}
