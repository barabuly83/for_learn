import 'app_route.dart';
import 'register_route.dart';

class LoginRoute extends AppRoute {
  static const String _routePath = '/login';
  static const String _routeName = 'login';

  late final RegisterRoute register = RegisterRoute(
    routePath: routePath,
    routeName: routeName,
  );

  LoginRoute() : super(routeName: _routeName, routePath: _routePath);
}
