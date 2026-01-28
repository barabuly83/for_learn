import 'app_route.dart';

class ProfileRoute extends AppRoute {
  static const String _routePath = '/profile';
  static const String _routeName = 'profile';

  ProfileRoute({
    String? routePath,
    String? routeName,
  }) : super(
          routeName: routeName ?? _routeName,
          routePath: routePath ?? _routePath,
        );
}
