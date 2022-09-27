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
        initialRoute: '/splash',
        onGenerateRoute: RoutesApp.generateRoute,
      ),
    ),
  );
}
