import 'package:flutter/material.dart';

import '../../shared/bottom_navigation/bottom_navigation_page.dart';

class MovimentationsScreen extends StatefulWidget {
  const MovimentationsScreen({Key? key}) : super(key: key);

  @override
  State<MovimentationsScreen> createState() => _MovimentationsScreenState();
}

class _MovimentationsScreenState extends State<MovimentationsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Página em construção'),
      ),
      bottomNavigationBar: BottomNavigationWallet(
        selectedIndex: 1,
      ),
    );
  }
}
