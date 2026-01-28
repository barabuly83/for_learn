import 'app_route.dart';

class RegisterRoute extends AppRoute {
  static const String _routePath = '/register';
  static const String _routeName = 'register';

  RegisterRoute({String? routePath, String? routeName})
    : super(
        routeName: routeName ?? _routeName,
        routePath: routePath ?? _routePath,
      );
}
