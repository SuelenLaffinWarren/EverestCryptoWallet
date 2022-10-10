import 'package:everest_card2_listagem/success/widgets/app_bar_success.dart';
import 'package:flutter/material.dart';

import '../widgets/body_success.dart';

class SucessConversionScreen extends StatefulWidget {
  const SucessConversionScreen({Key? key}) : super(key: key);
  static const route = '/success';

  @override
  State<SucessConversionScreen> createState() => _SucessConversionScreenState();
}

class _SucessConversionScreenState extends State<SucessConversionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSuccess(),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BodySuccess(),
        ),
      ),
    );
  }
}
