import '../../details_crypto/bitcoin_details/widgets/bitcoin_details_screen.dart';
import '../../details_crypto/ethereum_details/widgtes/eth_details_screen.dart';
import '../../details_crypto/litecoin_details/widgets/ltc_details_screen.dart';
import '../../movimentations/view/movimentations_screen.dart';
import '../../portfolio/view/home_portofolio_screen.dart';
import '../splash/splash_screen.dart';

var routesNavigation = {
  '/': (context) => const SplashScreen(),
  '/home_portfolio_screen': (context) => const HomePortofolioScreen(),
  '/movimentations_screen': (context) => const MovimentationsScreen(),
  '/bitcoin_details_screen': (context) => const BitcoinDetailsScreen(),
  '/ltc_details_screen': (context) => const LtcDetailsScreen(),
  '/eth_details_screen': (context) => const EthDetailsScreen()
};
