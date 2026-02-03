import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import 'app/router/quiz_app.dart';
import 'app/router/routes/app_router.dart';
import 'domain/models/auth_service.dart';
import 'domain/models/quiz_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Загружаем переменные окружения
  await dotenv.load();

  // Инициализация Firebase ДО создания сервисов
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // App Check отключен для упрощения разработки

  // Инициализация Firebase сервисов
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Настройка Firebase эмуляторов
  if (const bool.fromEnvironment('USE_STORAGE_EMULATOR') ||
      const bool.fromEnvironment('USE_FIRESTORE_EMULATOR')) {
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

    // Настройка Storage эмулятора
    if (const bool.fromEnvironment('USE_STORAGE_EMULATOR')) {
      await storage.useStorageEmulator(emulatorHost, 9199);
    }

    // Настройка Firestore эмулятора
    if (const bool.fromEnvironment('USE_FIRESTORE_EMULATOR')) {
      try {
        firestore.useFirestoreEmulator(emulatorHost, 8080);
      } catch (e) {
        // Failed to configure Firestore emulator, falling back to production
      }
    }
  }

  // Создание Dio клиента ПОСЛЕ инициализации Firebase
  final Dio dio = _createDio();

  // Создание сервисов с правильным порядком инициализации
  final AuthServiceImpl authService = AuthServiceImpl(
    firebaseAuth: FirebaseAuth.instance,
  );
  final QuizServiceImpl quizService = QuizServiceImpl(dio: dio);
  final GoRouter router = createRouter(authService);

  // Создание и запуск приложения
  final QuizApp quizApp = QuizApp(
    authService: authService,
    router: router,
    quizService: quizService,
    storage: storage,
  );

  runApp(quizApp);
}

/// Создает и настраивает экземпляр Dio клиента
Dio _createDio() {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://quizapi.io/api'));

  // Добавляем interceptor для аутентификации и API ключа
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          // Проверяем, является ли запрос к QuizAPI
          final isQuizApiRequest = options.uri.host.contains('quizapi.io');

          // Добавляем токен аутентификации Firebase только для НЕ QuizAPI запросов
          // QuizAPI не требует Authorization заголовок и он вызывает CORS ошибку
          if (!isQuizApiRequest) {
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              try {
                final token = await user.getIdToken();
                options.headers['Authorization'] = 'Bearer $token';
              } catch (e) {
                // print('Warning: Failed to get auth token: $e');
              }
            }
          }

          // Добавляем API ключ только для QuizAPI запросов
          if (isQuizApiRequest) {
            // Получаем API ключ из переменных окружения или используем значение по умолчанию
            final apiKey = dotenv.env['QUIZ_API_KEY'] ?? 'pOJOi46QclykSxaoHTdnAmpDPzMO3qjgw2nToUg5';

            options.queryParameters['apiKey'] = apiKey;
          }

          handler.next(options);
        } catch (e) {
          // print('❌ Request interceptor error: $e');
          handler.reject(
            DioException(
              requestOptions: options,
              error: e,
            ),
          );
        }
      },
      onResponse: (response, handler) {
        // Логируем только ошибки и важные ответы
        if (response.requestOptions.uri.host.contains('quizapi.io')) {
          // Response handling for QuizAPI (logging removed)
        }
        handler.next(response);
      },
      onError: (error, handler) {
        // Error handling for QuizAPI (logging removed)
        handler.next(error);
      },
    ),
  );

  return dio;
}
