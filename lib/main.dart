import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/config/dependencies.dart';
import 'package:sample_app/routing/router.dart';

void main() {
  runApp(MultiProvider(providers: providersList, child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router());
  }
}
