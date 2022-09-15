import 'package:everest_card2_listagem/movimentations/movimentations_screen.dart';
import 'package:everest_card2_listagem/portofolio/home_portofolio_screen.dart';
import 'package:everest_card2_listagem/shared/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Everest3 Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home_portofolio_screen': (context) => const HomePortofolioScreen(),
          '/movimetations_screen': (context) => const MovimentationsScreen()
        },
      ),
    ),
  );
}
