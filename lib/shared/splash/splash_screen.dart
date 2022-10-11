import 'package:everest_card2_listagem/portfolio/view/home_portofolio_screen.dart';
import 'package:everest_card2_listagem/shared/utils/arguments.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/splash';
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushNamed(
              HomePortfolioScreen.route,
            ));
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
