import 'package:everest_card2_listagem/shared/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'shared/routes/routes.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Everest3 Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.route,
        onGenerateRoute: RoutesApp.generateRoute,
      ),
    ),
  );
}
