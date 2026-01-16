class AppStrings {
  static const String appTitle = 'Weather App';
  static const String loading = 'Loading...';
  static const String error = 'Error';
  static const String retry = 'Retry';
  static const String temperature = 'Temperature';
  static const String humidity = 'Humidity';
  static const String windSpeed = 'Wind Speed';
  static const String pressure = 'Pressure';
  static const String celsius = '°C';
  static const String percent = '%';
  static const String meterPerSecond = 'm/s';
  static const String hPa = 'hPa';

  // API
  static const String apiKey =
      'eea1e2560dbaac566c2f7ca68ec040cc'; // Replace with your OpenWeatherMap API key
  static const String baseUrl = 'https://api.openweathermap.org';
  static const String weatherEndpoint = '/data/2.5/weather';
  static const String defaultCity = 'London'; // Город по умолчанию
}
