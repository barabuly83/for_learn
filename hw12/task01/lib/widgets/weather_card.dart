import 'package:flutter/material.dart';
import 'package:task01/models/weather.dart';
import 'package:task01/constants/app_strings.dart';
import 'package:task01/widgets/weather_info_row.dart';

class WeatherCard extends StatelessWidget {
  final WeatherResponse weatherData;

  const WeatherCard({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final weather = weatherData.weather.isNotEmpty
        ? weatherData.weather.first
        : null;
    final main = weatherData.main;
    final wind = weatherData.wind;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // City name
            Text(
              weatherData.name,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Weather description
            if (weather != null)
              Row(
                children: [
                  Text(
                    '${weather.main} - ${weather.description}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 8),
                  // Here you could add weather icon if you have assets
                ],
              ),

            const SizedBox(height: 16),

            // Temperature
            WeatherInfoRow(
              label: AppStrings.temperature,
              value: '${main.temp.toStringAsFixed(1)}${AppStrings.celsius}',
              icon: Icons.thermostat,
            ),

            // Feels like temperature
            WeatherInfoRow(
              label: 'Feels like',
              value:
                  '${main.feelsLike.toStringAsFixed(1)}${AppStrings.celsius}',
              icon: Icons.thermostat_outlined,
            ),

            // Min/Max temperature
            Row(
              children: [
                Expanded(
                  child: WeatherInfoRow(
                    label: 'Min',
                    value:
                        '${main.tempMin.toStringAsFixed(1)}${AppStrings.celsius}',
                    icon: Icons.arrow_downward,
                  ),
                ),
                Expanded(
                  child: WeatherInfoRow(
                    label: 'Max',
                    value:
                        '${main.tempMax.toStringAsFixed(1)}${AppStrings.celsius}',
                    icon: Icons.arrow_upward,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Humidity
            WeatherInfoRow(
              label: AppStrings.humidity,
              value: '${main.humidity}${AppStrings.percent}',
              icon: Icons.water_drop,
            ),

            // Pressure
            WeatherInfoRow(
              label: AppStrings.pressure,
              value: '${main.pressure} ${AppStrings.hPa}',
              icon: Icons.speed,
            ),

            // Wind speed
            WeatherInfoRow(
              label: AppStrings.windSpeed,
              value:
                  '${wind.speed.toStringAsFixed(1)} ${AppStrings.meterPerSecond}',
              icon: Icons.air,
            ),
          ],
        ),
      ),
    );
  }
}
