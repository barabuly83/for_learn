import 'app_route.dart';

class CategoriesRoute extends AppRoute {
  static const String _routePath = "/categories";
  static const String _routeName = "categories";

  CategoriesRoute({
    String? routePath,
    String? routeName,
  }) : super(
          routeName: routeName ?? _routeName,
          routePath: routePath ?? _routePath,
        );
}
