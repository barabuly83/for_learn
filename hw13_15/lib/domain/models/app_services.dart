import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'quiz_service.dart';
import 'storage_service.dart';

/// InheritedWidget для доступа к сервисам приложения
class AppServices extends InheritedWidget {
  final AuthService authService;
  final QuizService quizService;
  final FirebaseStorage storage;
  final StorageService storageService;

  const AppServices({
    super.key,
    required this.authService,
    required this.quizService,
    required this.storage,
    required this.storageService,
    required super.child,
  });

  /// Получить сервисы из контекста
  static AppServices of(BuildContext context) {
    final AppServices? result =
        context.dependOnInheritedWidgetOfExactType<AppServices>();
    assert(result != null, 'No AppServices found in context');
    return result!;
  }

  /// Показать SnackBar с сообщением
  void snackBarDispatcher(BuildContext context, String message) {
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  @override
  bool updateShouldNotify(AppServices oldWidget) {
    return authService != oldWidget.authService ||
        quizService != oldWidget.quizService ||
        storage != oldWidget.storage ||
        storageService != oldWidget.storageService;
  }
}
