import 'package:flutter/material.dart';
import '../../../domain/auth_service.dart';
import '../../../domain/quiz_service.dart';

/// InheritedWidget для доступа к сервисам приложения
class AppServices extends InheritedWidget {
  final AuthService authService;
  final QuizService quizService;

  const AppServices({
    super.key,
    required this.authService,
    required this.quizService,
    required super.child,
  });

  /// Получить сервисы из контекста
  static AppServices of(BuildContext context) {
    final AppServices? result =
        context.dependOnInheritedWidgetOfExactType<AppServices>();
    assert(result != null, 'No AppServices found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppServices oldWidget) {
    return authService != oldWidget.authService ||
        quizService != oldWidget.quizService;
  }
}
