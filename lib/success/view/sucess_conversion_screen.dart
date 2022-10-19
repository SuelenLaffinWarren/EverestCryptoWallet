import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../l10n/app_localizations.dart';

class SucessConversionScreen extends StatefulWidget {
  const SucessConversionScreen({Key? key}) : super(key: key);
  static const route = '/success';

  @override
  State<SucessConversionScreen> createState() => _SucessConversionScreenState();
}

class _SucessConversionScreenState extends State<SucessConversionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/movimentations');
              },
              child: Text(AppLocalizations.of(context)!.movimentations))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Lottie.asset('assets/lottie/check.json', width: 200, height: 200),
              Text(
                AppLocalizations.of(context)!.conversionPerformed,
                style:
                    const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(AppLocalizations.of(context)!.currencyConversionSuccessful,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
