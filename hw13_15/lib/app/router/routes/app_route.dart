/// Базовый класс для маршрутов приложения
abstract class AppRoute {
  final String routeName;
  final String routePath;

  const AppRoute({
    required this.routeName,
    required this.routePath,
  });
}
