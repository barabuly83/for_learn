import 'package:dio/dio.dart';
import 'package:task01/models/weather.dart';
import 'package:task01/models/weather_error.dart';
import 'package:task01/services/logging_interceptor.dart';
import 'package:task01/constants/app_strings.dart';

class WeatherService {
  final Dio _dio;

  WeatherService({Dio? dio}) : _dio = dio ?? _createDefaultDio();

  static Dio _createDefaultDio() {
    final dio = Dio();
    dio.interceptors.add(LoggingInterceptor());
    return dio;
  }

  Future<WeatherResponse> getWeather() async {
    try {
      // Используем город по умолчанию из констант
      final response = await _dio.get(
        '${AppStrings.baseUrl}${AppStrings.weatherEndpoint}',
        queryParameters: {
          'q': AppStrings.defaultCity, // Город из констант
          'appid': AppStrings.apiKey,
          'units': 'metric',
        },
      );

      return WeatherResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw WeatherError.apiError(
        e.message ?? 'Unknown Dio error',
        e.response?.statusCode ?? 500,
      );
    } catch (e) {
      throw WeatherError.fromException(e as Exception);
    }
  }
}
