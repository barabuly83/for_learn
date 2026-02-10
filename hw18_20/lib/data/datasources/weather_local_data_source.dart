import '../models/weather_model.dart';

/// Абстракция для локального источника данных погоды (кэш)
/// Скрывает детали реализации работы с локальным хранилищем
/// В реальном приложении здесь мог бы быть Hive, SharedPreferences, SQLite и т.д.
abstract class WeatherLocalDataSource {
  Future<WeatherModel?> getCachedWeather(String city);
  Future<void> cacheWeather(WeatherModel weather);
  Future<List<WeatherModel>> getCachedForecast(String city);
  Future<void> cacheForecast(String city, List<WeatherModel> forecast);
}
