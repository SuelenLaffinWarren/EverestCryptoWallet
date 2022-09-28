import 'package:everest_card2_listagem/shared/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../crypto_details/crypto_details_screen.dart';
import '../../movimentations/view/movimentations_screen.dart';
import '../../portfolio/view/home_portofolio_screen.dart';
import '../../portfolio/model/crypto_view_data.dart';

class Arguments {
  CryptoViewData cryptoData;

  Arguments({
    required this.cryptoData,
  });
}

class RoutesApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePortfolioScreen.route:
        return MaterialPageRoute(builder: (_) => const HomePortfolioScreen());
      case MovimentationsScreen.route:
        return MaterialPageRoute(builder: (_) => const MovimentationsScreen());
      case SplashScreen.route:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case DetailsCryptoScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            Arguments arguments = settings.arguments as Arguments;

            return DetailsCryptoScreen(
              crypto: arguments.cryptoData,
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
