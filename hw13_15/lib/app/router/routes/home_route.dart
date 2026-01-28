import 'app_route.dart';
import 'categories_route.dart';
import 'profile_route.dart';

class HomeRoute extends AppRoute {
  static const String _routePath = '/home';
  static const String _routeName = 'home';

  late final ProfileRoute profile = ProfileRoute(
    routePath: routePath,
    routeName: routeName,
  );
  late final CategoriesRoute categories = CategoriesRoute(
    routePath: routePath,
    routeName: routeName,
  );

  HomeRoute() : super(routeName: _routeName, routePath: _routePath);
}
