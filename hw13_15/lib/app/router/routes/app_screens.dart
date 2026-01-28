/// Enum для определения экранов приложения
enum AppScreens {
  login('/login'),
  home('/'),
  categories('/categories'),
  questions('/questions'),
  result('/result'),
  results('/results'),
  profile('/profile');

  const AppScreens(this.routePath);

  final String routePath;

  String get routeName => name;

  /// Вложенные маршруты для login
  static const loginRegister = _LoginRegister();
}

/// Вложенные маршруты для экрана логина
class _LoginRegister {
  const _LoginRegister();

  String get routePath => '/register';
  String get routeName => 'register';
}
