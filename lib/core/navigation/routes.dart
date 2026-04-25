import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/core/navigation/navigation_service.dart';
import 'package:products_app/core/navigation/shells/shells.dart';
import 'package:products_app/presentation/home/view/home_page.dart';
import 'package:products_app/presentation/product_details/view/product_details_page.dart';

GoRouter? _router;
final _appShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'AppShellRouteNavigatorKey',
);

GoRouter createRouterConfig({required String initialLocation}) {
  _router ??= GoRouter(
    initialLocation: initialLocation,
    routes: [
      ShellRoute(
        navigatorKey: _appShellNavigatorKey,
        builder: (context, state, widget) => AppShell(child: widget),
        routes: [
          GoRoute(
            name: NavigationRoute.home.path,
            path: NavigationRoute.home.fullPath,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: NavigationRoute.productDetails.path,
            path: NavigationRoute.productDetails.fullPath,
            builder: (context, state) => const ProductDetailsPage(),
          ),
        ],
      ),
    ],
  );

  return _router!;
}
