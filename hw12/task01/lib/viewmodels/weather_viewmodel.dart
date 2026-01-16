import 'package:flutter/material.dart';
import 'package:task01/models/weather.dart';
import 'package:task01/models/weather_error.dart';
import 'package:task01/services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherService _weatherService;

  WeatherViewModel({WeatherService? weatherService})
    : _weatherService = weatherService ?? WeatherService();

  WeatherResponse? _weatherData;
  WeatherResponse? get weatherData => _weatherData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  WeatherError? _error;
  WeatherError? get error => _error;

  Future<void> fetchWeather() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _weatherData = await _weatherService.getWeather();
    } on WeatherError catch (e) {
      _error = e;
    } catch (e) {
      // Handle any other unexpected errors
      _error = WeatherError.unknownError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
