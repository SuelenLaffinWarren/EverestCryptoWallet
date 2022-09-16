import '../../crypto_details/crypto_details_screen.dart';

import '../../movimentations/view/movimentations_screen.dart';
import '../../portfolio/view/home_portofolio_screen.dart';
import '../splash/splash_screen.dart';

var routesNavigation = {
  '/': (context) => const SplashScreen(),
  '/home_portfolio_screen': (context) => const HomePortofolioScreen(),
  '/movimentations_screen': (context) => const MovimentationsScreen(),
  '/details_crypto_screen': (context) => DetailsCryptoScreen(),
};
