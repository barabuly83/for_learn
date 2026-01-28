import 'package:go_router/go_router.dart';
import 'app_route.dart';
import 'result_argument.dart';

class ResultRoute extends AppRoute {
  static const String _routePath = '/result';
  static const String _routeName = 'result';

  const ResultRoute({
    String? routePath,
    String? routeName,
  }) : super(
          routeName: (routeName ?? '') + _routeName,
          routePath: (routePath ?? '') + _routePath,
        );

  /// Переход на экран результата с параметрами
  void push(
    GoRouter router, {
    required String category,
    required String countCorrectAnswers,
  }) {
    final ResultArgument arguments = ResultArgument(
      category: category,
      correctAnswers: countCorrectAnswers,
    );
    final Map<String, String> queryParams = arguments.toJson().map(
          (key, value) => MapEntry(key, value.toString()),
        );
    final Uri uri = Uri(
      path: routePath,
      queryParameters: queryParams,
    );
    router.push(uri.toString());
  }

  /// Создает ResultArgument из query параметров
  static ResultArgument withResultArgument(
    Map<String, dynamic> queryParameters,
  ) {
    return ResultArgument.fromJson(queryParameters);
  }
}
