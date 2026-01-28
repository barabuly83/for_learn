import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/model.dart';
import '../../models/quiz_result.dart';
import 'firestore_service.dart';

/// Интерфейс сервиса викторин
abstract interface class QuizService {
  /// Получить список категорий
  Future<List<Category>> fetchCategories();

  /// Получить вопросы для категории
  Future<List<Question>> fetchQuestions(int categoryId);

  /// Получить вопросы для категории с фильтрами
  Future<List<Question>> fetchQuestionsWithFilters({
    required String categoryName,
    int? limit,
    String? difficulty,
  });

  /// Получить результаты последних викторин пользователя
  Future<List<QuizResult>> fetchQuizResults({int limit = 10});

  /// Получить случайные вопросы (для тестирования)
  Future<List<Question>> fetchRandomQuestions({int limit = 10});
}

/// Реализация сервиса викторин
class QuizServiceImpl implements QuizService {
  final Dio _dio;
  List<Category>? _cachedCategories;
  DateTime? _lastCategoriesFetch;

  QuizServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<Category>> fetchCategories() async {
    // Возвращаем закешированные категории, если они есть и свежие (менее 1 часа)
    if (_cachedCategories != null &&
        _lastCategoriesFetch != null &&
        DateTime.now().difference(_lastCategoriesFetch!).inHours < 1) {
      return _cachedCategories!;
    }

    try {
      // Запрос категорий - apiKey передается через query parameter в interceptor
      final response = await _dio.get<dynamic>('/v1/categories');

      // Проверяем статус ответа
      if (response.statusCode != 200) {
        throw Exception('API returned status ${response.statusCode}');
      }

      // Обрабатываем разные форматы ответа
      List<dynamic> data;
      if (response.data is List) {
        data = response.data as List;
      } else if (response.data is Map) {
        final responseMap = response.data as Map<String, dynamic>;
        if (responseMap.containsKey('categories')) {
          data = responseMap['categories'] as List? ?? [];
        } else {
          data = [];
        }
      } else {
        data = [];
      }

      if (data.isEmpty) {
        throw Exception('No categories found in API response');
      }

      // Парсим категории с обработкой ошибок
      try {
        _cachedCategories = data
            .map((json) {
              try {
                if (json is Map<String, dynamic>) {
                  return Category.fromJson(json);
                }
                return null;
              } catch (e) {
                // Пропускаем некорректные категории
                return null;
              }
            })
            .whereType<Category>()
            .take(10) // Ограничиваем до 10 категорий
            .toList();

        if (_cachedCategories!.isEmpty) {
          throw Exception('Failed to parse any categories from API response');
        }

        _lastCategoriesFetch = DateTime.now();
        return _cachedCategories!;
      } catch (e) {
        throw Exception('Failed to parse categories: $e');
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 429) {
          throw Exception('Rate limit exceeded. Please try again later.');
        }
        // Если есть старый кеш, возвращаем его при ошибке сети
        if (_cachedCategories != null) {
          return _cachedCategories!;
        }
        // Пробрасываем DioException с деталями
        throw Exception('Failed to fetch categories: ${e.message}');
      }

      // Если есть старый кеш, возвращаем его при любой ошибке
      if (_cachedCategories != null) {
        return _cachedCategories!;
      }
      // Пробрасываем оригинальную ошибку с контекстом
      throw Exception('Failed to fetch categories: $e');
    }
  }

  @override
  Future<List<Question>> fetchQuestions(int categoryId) async {
    try {
      // Рекомендуется использовать fetchQuestionsWithFilters вместо этого метода
      final response = await _dio.get<dynamic>(
        '/v1/questions',
        queryParameters: {'category': categoryId.toString(), 'limit': '10'},
      );

      final List<dynamic> data;
      if (response.data is List) {
        data = response.data as List<dynamic>;
      } else if (response.data is Map) {
        final mapData = response.data as Map<String, dynamic>;
        data = (mapData['questions'] as List<dynamic>?) ?? [];
      } else {
        data = [];
      }

      return data
          .map((json) => Question.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Question>> fetchQuestionsWithFilters({
    required String categoryName,
    int? limit,
    String? difficulty,
  }) async {
    try {
      // Создаем queryParameters для запроса
      // apiKey будет добавлен автоматически через interceptor
      final queryParams = <String, dynamic>{'limit': (limit ?? 10).toString()};

      if (categoryName.isNotEmpty) {
        queryParams['category'] = categoryName;
      }

      if (difficulty != null && difficulty.toLowerCase() != 'all') {
        // Передаем сложность строго в нижнем регистре, как в примерах API
        queryParams['difficulty'] = difficulty.toLowerCase();
      }

      final response = await _dio.get<dynamic>(
        '/v1/questions',
        queryParameters: queryParams,
      );

      if (response.statusCode != 200) {
        throw Exception('API returned status ${response.statusCode}');
      }

      // Проверяем на ошибки API в теле ответа
      if (response.data is Map<String, dynamic> &&
          (response.data as Map<String, dynamic>).containsKey('error')) {
        final error = (response.data as Map<String, dynamic>)['error'];
        throw Exception('QuizAPI Error: $error');
      }

      List<dynamic> data;
      if (response.data is List) {
        data = response.data as List<dynamic>;
      } else if (response.data is Map) {
        final responseMap = response.data as Map<String, dynamic>;
        if (responseMap.containsKey('questions')) {
          data = responseMap['questions'] as List<dynamic>? ?? [];
        } else if (responseMap.containsKey('data')) {
          data = responseMap['data'] as List<dynamic>? ?? [];
        } else {
          // Если API вернул какой-то другой формат Map, попробуем найти список
          data = responseMap.values.whereType<List<dynamic>>().firstOrNull ?? [];
        }
      } else {
        data = [];
      }

      return data
          .map((json) {
            if (json is Map<String, dynamic>) {
              try {
                return Question.fromJson(json);
              } catch (e) {
                return null;
              }
            }
            return null;
          })
          .whereType<Question>()
          .toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 429) {
        throw Exception('Rate limit exceeded. Please try again later.');
      }
      rethrow;
    }
  }

  @override
  Future<List<QuizResult>> fetchQuizResults({int limit = 10}) async {
    try {
      final firestoreService = FirestoreService(FirebaseFirestore.instance);
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        return [];
      }

      final rawResults = await firestoreService.getUserQuizResults(
        currentUser.uid,
      );

      final results = rawResults
          .take(limit)
          .map((data) {
            // Проверяем наличие всех необходимых полей
            final requiredFields = [
              'userId',
              'category',
              'score',
              'totalQuestions',
              'percentage',
              'timeSpent',
            ];
            final missingFields = requiredFields
                .where(
                  (field) => !data.containsKey(field) || data[field] == null,
                )
                .toList();

            if (missingFields.isNotEmpty) {
              return null; // Пропустим этот документ
            }

            // Используем правильный timestamp для ID
            final timestamp = data['timestamp'];
            String id;

            if (timestamp is Timestamp) {
              id = timestamp.millisecondsSinceEpoch.toString();
            } else if (timestamp is DateTime) {
              id = timestamp.millisecondsSinceEpoch.toString();
            } else if (timestamp != null) {
              // Если timestamp есть, но не Timestamp/DateTime, преобразуем
              try {
                id = timestamp.toString();
              } catch (e) {
                id = DateTime.now().millisecondsSinceEpoch.toString();
              }
            } else {
              // Если timestamp null, используем текущую дату (для старых записей)
              id = DateTime.now().millisecondsSinceEpoch.toString();
            }

            try {
              final result = QuizResult.fromJson({
                ...data,
                'id': id,
                'userId': currentUser.uid,
              });

              return result;
            } catch (e) {
              return null; // Пропустим этот документ
            }
          })
          .where((result) => result != null)
          .cast<QuizResult>()
          .toList();

      return results;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Question>> fetchRandomQuestions({int limit = 10}) async {
    try {
      final response = await _dio.get<dynamic>(
        '/v1/questions',
        queryParameters: {'limit': limit.toString()},
      );

      final List<dynamic> data;
      if (response.data is List) {
        data = response.data as List<dynamic>;
      } else if (response.data is Map) {
        final mapData = response.data as Map<String, dynamic>;
        data = (mapData['questions'] as List<dynamic>?) ?? [];
      } else {
        data = [];
      }

      return data
          .map((json) => Question.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
