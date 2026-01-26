import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import 'app/router/quiz_app.dart';
import 'app/router/routes/app_router.dart';
import 'domain/models/auth_service.dart';
import 'domain/models/quiz_service.dart';

// Инициализация сервисов
final Dio dio = _createDio();
final QuizServiceImpl _quizService = QuizServiceImpl(dio: dio);
final AuthServiceImpl _authService = AuthServiceImpl(
  firebaseAuth: FirebaseAuth.instance,
);
final FirebaseStorage _storage = FirebaseStorage.instance;
final GoRouter _router = createRouter(_authService);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Настройка Firebase Storage эмулятора (только для тестирования Storage)
  if (const bool.fromEnvironment('USE_STORAGE_EMULATOR', defaultValue: false)) {
    // Для Android эмулятора используем 10.0.2.2, для остальных платформ - 127.0.0.1
    String emulatorHost = '127.0.0.1';
    if (!kIsWeb) {
      try {
        if (Platform.isAndroid) {
          emulatorHost = '10.0.2.2';
        }
      } catch (e) {
        // Platform недоступен, используем значение по умолчанию
      }
    }
    await FirebaseStorage.instance.useStorageEmulator(emulatorHost, 9199);
  }

  final QuizApp quizApp = QuizApp(
    authService: _authService,
    router: _router,
    quizService: _quizService,
    storage: _storage,
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
  
  // Добавляем interceptor для аутентификации и API ключа
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Добавляем токен аутентификации Firebase, если пользователь авторизован
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          try {
            final token = await user.getIdToken();
            options.headers['Authorization'] = 'Bearer $token';
          } catch (e) {
            // Если не удалось получить токен, продолжаем без него
          }
        }
        
        // Добавляем API ключ к каждому запросу
        // TODO: Замените на реальный API ключ от quizapi.io или используйте переменную окружения
        options.queryParameters['apiKey'] = 'YOUR_API_KEY_HERE';
        
        handler.next(options);
      },
    ),
  );
  
  return dio;
}
