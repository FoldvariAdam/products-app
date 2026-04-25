import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/navigation/navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = createRouterConfig(
    initialLocation: NavigationRoute.home.fullPath,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}