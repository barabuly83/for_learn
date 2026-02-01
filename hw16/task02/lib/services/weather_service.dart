import 'dart:math';
import '../models/weather.dart';

class WeatherService {
  // Имитация API для получения данных о погоде
  Future<Weather> fetchWeather(String cityName) async {
    // Имитируем задержку сети
    await Future<void>.delayed(const Duration(seconds: 2));

    // Имитируем случайную ошибку для некоторых городов
    if (cityName.toLowerCase() == 'error') {
      throw Exception(
        'Не удалось загрузить данные о погоде для города $cityName',
      );
    }

    // Имитируем случайные данные о погоде
    final random = Random();
    final temperature = 15 + random.nextInt(20); // 15-35°C
    final descriptions = [
      'Ясно',
      'Облачно',
      'Дождь',
      'Снег',
      'Гроза',
      'Пасмурно',
    ];
    final icons = ['☀️', '☁️', '🌧️', '❄️', '⛈️', '☁️'];

    final index = random.nextInt(descriptions.length);

    return Weather(
      cityName: cityName,
      temperature: temperature.toDouble(),
      description: descriptions[index],
      icon: icons[index],
    );
  }
}
