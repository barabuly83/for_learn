import 'weather_remote_data_source.dart';
import '../models/weather_model.dart';

/// Реализация удаленного источника данных погоды
/// В реальном приложении здесь был бы HTTP-клиент для работы с API
/// (например, используя пакет http или dio)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  @override
  Future<WeatherModel> getWeatherByCity(String city) async {
    // Симуляция задержки сети
    await Future<void>.delayed(const Duration(seconds: 1));

    // В реальном приложении здесь был бы HTTP-запрос:
    // final response = await http.get(Uri.parse('$baseUrl/weather?city=$city'));
    // return WeatherModel.fromJson(jsonDecode(response.body));

    // Mock данные
    return WeatherModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      city: city,
      temperature: 22.5,
      description: 'Sunny',
      humidity: 65,
      windSpeed: 10.2,
    );
  }

  @override
  Future<List<WeatherModel>> getWeatherForecast(String city) async {
    // Симуляция задержки сети
    await Future<void>.delayed(const Duration(seconds: 1));

    // В реальном приложении здесь был бы HTTP-запрос для получения прогноза
    // Mock данные - прогноз на 3 дня
    return List.generate(3, (index) {
      return WeatherModel(
        id: '${DateTime.now().millisecondsSinceEpoch}_$index',
        city: city,
        temperature: 20.0 + index * 2.0,
        description: ['Sunny', 'Cloudy', 'Rainy'][index],
        humidity: 60 + index * 5,
        windSpeed: 8.0 + index * 1.5,
      );
    });
  }
}
