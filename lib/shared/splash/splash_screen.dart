import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../portfolio/view/home_portofolio_screen.dart';
import '../../portfolio/widgtes/crypto_list_view.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const HomePortfolioScreen();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset('assets/lottie/bitcoin2.json'),
      ),
    );
  }
}
