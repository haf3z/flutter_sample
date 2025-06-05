import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/data/api_client.dart';
import 'package:sample_app/data/dio.dart';
import 'package:sample_app/ui/home_page.dart';
import 'package:sample_app/ui/post_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
      Provider(create: (context) => getDio()),
      Provider(create: (context) => ApiClient(dio: context.read())),
      ],
     child:  MainApp()
    )
    );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(
          viewmodel: PostViewmodel(apiClient: context.read())
        )
      ),
    );
  }
}
