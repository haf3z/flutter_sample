import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/data/api_client.dart';
import 'package:sample_app/data/dio.dart';
import 'package:sample_app/data/repositories/post_repository.dart';
import 'package:sample_app/routing/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => getDio()),
        Provider(create: (context) => ApiClient(dio: context.read())),
        Provider(
          create: (context) => PostRepository(apiClient: context.read()),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router());
  }
}
