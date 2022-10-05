import 'package:flutter/material.dart';

import '../../conversion/view/conversion_screen.dart';
import '../splash/splash_screen.dart';

import '../../crypto_details/view/crypto_details_screen.dart';
import '../../movimentations/view/movimentations_screen.dart';
import '../../portfolio/view/home_portofolio_screen.dart';
import '../utils/arguments.dart';

class RoutesApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePortfolioScreen.route:
        return MaterialPageRoute(builder: (_) {
          return const HomePortfolioScreen();
        });
      case MovimentationsScreen.route:
        return MaterialPageRoute(builder: (_) => const MovimentationsScreen());
      case ConversionScreen.route:
        return MaterialPageRoute(builder: (context) {
          final args = settings.arguments as Arguments;
          return ConversionScreen(
            args: args,
          );
        });
      case SplashScreen.route:
        return MaterialPageRoute(builder: (_) {
          return const SplashScreen();
        });
      case DetailsCryptoScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Arguments;

            return DetailsCryptoScreen(
              crypto: args.cryptoData,
              userValue: args.userCryptoValue,
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("Rota não definida para ${settings.name}"),
            ),
          ),
        );
    }
  }
}
