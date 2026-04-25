import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/core/di/injection.dart';
import 'package:products_app/core/navigation/navigation.dart';

void main() {
  configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = createRouterConfig(
    initialLocation: NavigationRoute.home.fullPath,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
