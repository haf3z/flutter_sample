import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    // return const MaterialApp(home: HomeScreen());
    return MaterialApp.router(routerConfig: router());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) => navigationShell.goBranch(index),
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
          NavigationDestination(
            icon: Icon(Icons.album_outlined),
            label: "Album",
          ),
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/album')) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
      case 1:
        GoRouter.of(context).go('/album');
    }
  }
}
