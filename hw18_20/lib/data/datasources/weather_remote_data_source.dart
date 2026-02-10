import '../models/weather_model.dart';

/// Абстракция для удаленного источника данных погоды (API)
/// Скрывает детали реализации работы с внешним API
abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherByCity(String city);
  Future<List<WeatherModel>> getWeatherForecast(String city);
}
