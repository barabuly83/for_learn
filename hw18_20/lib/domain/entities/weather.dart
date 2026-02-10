import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({
    required this.id,
    required this.city,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
  });

  final String id;
  final String city;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;

  @override
  List<Object?> get props => [id, city, temperature, description, humidity, windSpeed];
}
