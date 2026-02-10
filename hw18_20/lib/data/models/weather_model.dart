import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.id,
    required super.city,
    required super.temperature,
    required super.description,
    required super.humidity,
    required super.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'] as String? ?? '',
      city: json['city'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      description: json['description'] as String,
      humidity: json['humidity'] as int,
      windSpeed: (json['windSpeed'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'city': city,
      'temperature': temperature,
      'description': description,
      'humidity': humidity,
      'windSpeed': windSpeed,
    };
  }

  Weather toEntity() {
    return Weather(
      id: id,
      city: city,
      temperature: temperature,
      description: description,
      humidity: humidity,
      windSpeed: windSpeed,
    );
  }

  factory WeatherModel.fromEntity(Weather weather) {
    return WeatherModel(
      id: weather.id,
      city: weather.city,
      temperature: weather.temperature,
      description: weather.description,
      humidity: weather.humidity,
      windSpeed: weather.windSpeed,
    );
  }
}
