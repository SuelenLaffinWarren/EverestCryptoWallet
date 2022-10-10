import 'package:everest_card2_listagem/revision/view/revision_screen.dart';
import 'package:everest_card2_listagem/success/view/sucess_conversion_screen.dart';
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
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomePortfolioScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.linear;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

      case MovimentationsScreen.route:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MovimentationsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.linear;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case ConversionScreen.route:
        final args = settings.arguments as Arguments;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ConversionScreen(
            args: args,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.linear;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case RevisionScreen.route:
        final args = settings.arguments as Arguments;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RevisionScreen(
            args: args,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.linear;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case SucessConversionScreen.route:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SucessConversionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case SplashScreen.route:
        return MaterialPageRoute(builder: (_) {
          return const SplashScreen();
        });
      case DetailsCryptoScreen.route:
        final args = settings.arguments as Arguments;

        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              DetailsCryptoScreen(
            crypto: args.cryptoData,
            userValue: args.userCryptoValue,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.linear;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
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
