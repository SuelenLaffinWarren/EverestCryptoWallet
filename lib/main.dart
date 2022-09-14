import 'package:everest_card2_listagem/movimentations/movimentations_screen.dart';
import 'package:everest_card2_listagem/portofolio/home_wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'shared/splash/splash_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Everest3 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/wallet_screen': (context) => const WalletScreen(),
        '/movimentations_screen': (context) => const MovimentationsScreen(),
      },
    );
  }
}
