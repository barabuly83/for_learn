import 'package:dio/dio.dart';
import '../../models/model.dart';

/// Интерфейс сервиса викторин
abstract interface class QuizService {
  /// Получить список категорий
  Future<List<Category>> fetchCategories();

  /// Получить вопросы для категории
  Future<List<Question>> fetchQuestions(String category);
}

/// Реализация сервиса викторин
class QuizServiceImpl implements QuizService {
  final Dio _dio;

  QuizServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<Category>> fetchCategories() async {
    try {
      final response = await _dio.get('/v1/categories');
      final List<dynamic> data = response.data is List
          ? response.data
          : (response.data as Map)['categories'] as List? ?? [];
      return data
          .map((json) => Category.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Question>> fetchQuestions(String category) async {
    try {
      final response = await _dio.get(
        '/v1/questions',
        queryParameters: {'category': category},
      );
      final List<dynamic> data = response.data is List
          ? response.data
          : (response.data as Map)['questions'] as List? ?? [];
      return data
          .map((json) => Question.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
