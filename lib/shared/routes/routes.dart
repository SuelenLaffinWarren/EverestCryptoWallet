import '../../crypto_details/crypto_details_screen.dart';
import '../../movimentations/view/movimentations_screen.dart';
import '../../portfolio/view/home_portofolio_screen.dart';
import '../splash/splash_screen.dart';

var routesNavigation = {
  SplashScreen.route: (context) => const SplashScreen(),
  HomePortfolioScreen.route: (context) => const HomePortfolioScreen(),
  MovimentationsScreen.route: (context) => const MovimentationsScreen(),
  DetailsCryptoScreen.route: (context) => const DetailsCryptoScreen(),
};
