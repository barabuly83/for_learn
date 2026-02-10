import 'weather_local_data_source.dart';
import '../models/weather_model.dart';

/// Реализация локального источника данных погоды
/// Использует in-memory кэш для демонстрации
/// В реальном приложении здесь был бы Hive, SharedPreferences или SQLite
class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  // In-memory кэш для демонстрации
  // В реальном приложении здесь был бы доступ к Hive box или другой БД
  final Map<String, WeatherModel> _weatherCache = {};
  final Map<String, List<WeatherModel>> _forecastCache = {};

  @override
  Future<WeatherModel?> getCachedWeather(String city) async {
    // Симуляция задержки чтения из БД
    await Future<void>.delayed(const Duration(milliseconds: 100));

    // В реальном приложении:
    // final box = await Hive.openBox('weather');
    // final json = box.get(city);
    // return json != null ? WeatherModel.fromJson(json) : null;

    return _weatherCache[city];
  }

  @override
  Future<void> cacheWeather(WeatherModel weather) async {
    // Симуляция задержки записи в БД
    await Future<void>.delayed(const Duration(milliseconds: 100));

    // В реальном приложении:
    // final box = await Hive.openBox('weather');
    // await box.put(weather.city, weather.toJson());

    _weatherCache[weather.city] = weather;
  }

  @override
  Future<List<WeatherModel>> getCachedForecast(String city) async {
    // Симуляция задержки чтения из БД
    await Future<void>.delayed(const Duration(milliseconds: 100));

    // В реальном приложении:
    // final box = await Hive.openBox('weather_forecast');
    // final jsonList = box.get(city);
    // return jsonList != null
    //   ? (jsonList as List).map((json) => WeatherModel.fromJson(json)).toList()
    //   : [];

    return _forecastCache[city] ?? [];
  }

  @override
  Future<void> cacheForecast(String city, List<WeatherModel> forecast) async {
    // Симуляция задержки записи в БД
    await Future<void>.delayed(const Duration(milliseconds: 100));

    // В реальном приложении:
    // final box = await Hive.openBox('weather_forecast');
    // await box.put(city, forecast.map((w) => w.toJson()).toList());

    _forecastCache[city] = forecast;
  }
}
