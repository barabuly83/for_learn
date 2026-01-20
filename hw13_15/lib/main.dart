import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import 'app/router/routes/quiz_app.dart';
import 'app/router/routes/app_router.dart';
import 'domain/auth_service.dart';
import 'domain/quiz_service.dart';

// Инициализация сервисов
final Dio dio = _createDio();
final QuizServiceImpl _quizService = QuizServiceImpl(dio: dio);
final AuthServiceImpl _authService = AuthServiceImpl(
  firebaseAuth: FirebaseAuth.instance,
);
final GoRouter _router = createRouter(_authService);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final QuizApp quizApp = QuizApp(
    authService: _authService,
    router: _router,
    quizService: _quizService,
  );
  runApp(quizApp);
}

/// Создает и настраивает экземпляр Dio клиента
Dio _createDio() {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://quizapi.io/api",
    ),
  );
  
  // Добавляем API ключ через interceptor для всех запросов
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // Добавляем API ключ к каждому запросу
        options.queryParameters['apiKey'] = 'YOUR_API_KEY_HERE';
        handler.next(options);
      },
    ),
  );
  
  return dio;
}
