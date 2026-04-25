import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/domain/products/models/models.dart';

enum NavigationRoute {
  home(),
  productDetails();

  final String? _customPath;

  const NavigationRoute({String? customPath}) : _customPath = customPath;

  String get path => _customPath ?? name;
}

extension NavigationRouteX on NavigationRoute {
  String get fullPath => '/${_customPath ?? name}';
}

class NavigationService {
  final BuildContext context;

  NavigationService(this.context);

  static NavigationService of(BuildContext context) =>
      NavigationService(context);

  void goBack<T extends Object?>([T? result]) =>
      GoRouter.of(context).pop(result);

  Future<bool?> goToDetailsPage({required Product product}) {
    return _goToPageImpl(
      context: context,
      route: NavigationRoute.productDetails,
      extra: {'product': product},
    );
  }

  Future<T?> _goToPageImpl<T>({
    required BuildContext context,
    required NavigationRoute route,
    Object? extra,
    Map<String, String> params = const {},
    bool? withoutStacking,
  }) {
    final routeName = route.path;
    final currentRoute = _getCurrentRoute(context);

    final newRoute = context.namedLocation(routeName, pathParameters: params);

    if (currentRoute == newRoute) return Future.value(null);

    if (withoutStacking == true) {
      return context.pushNamed<T>(
        routeName,
        extra: extra,
        pathParameters: params,
      );
    } else {
      return context.pushNamed<T>(
        routeName,
        extra: extra,
        pathParameters: params,
      );
    }
  }
  String _getCurrentRoute(BuildContext context) {
    return GoRouterState.of(context).uri.toString();
  }
}
