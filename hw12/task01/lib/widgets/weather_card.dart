import 'package:flutter/material.dart';
import 'package:task01/models/weather.dart';
import 'package:task01/constants/app_strings.dart';

class WeatherCard extends StatelessWidget {
  final WeatherResponse weatherData;

  const WeatherCard({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    final weather = weatherData.weather.isNotEmpty ? weatherData.weather.first : null;
    final main = weatherData.main;
    final wind = weatherData.wind;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // City name
            Text(
              weatherData.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
            _buildWeatherInfoRow(
              context,
              AppStrings.temperature,
              '${main.temp.toStringAsFixed(1)}${AppStrings.celsius}',
              Icons.thermostat,
            ),

            // Feels like temperature
            _buildWeatherInfoRow(
              context,
              'Feels like',
              '${main.feelsLike.toStringAsFixed(1)}${AppStrings.celsius}',
              Icons.thermostat_outlined,
            ),

            // Min/Max temperature
            Row(
              children: [
                Expanded(
                  child: _buildWeatherInfoRow(
                    context,
                    'Min',
                    '${main.tempMin.toStringAsFixed(1)}${AppStrings.celsius}',
                    Icons.arrow_downward,
                  ),
                ),
                Expanded(
                  child: _buildWeatherInfoRow(
                    context,
                    'Max',
                    '${main.tempMax.toStringAsFixed(1)}${AppStrings.celsius}',
                    Icons.arrow_upward,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Humidity
            _buildWeatherInfoRow(
              context,
              AppStrings.humidity,
              '${main.humidity}${AppStrings.percent}',
              Icons.water_drop,
            ),

            // Pressure
            _buildWeatherInfoRow(
              context,
              AppStrings.pressure,
              '${main.pressure} ${AppStrings.hPa}',
              Icons.speed,
            ),

            // Wind speed
            _buildWeatherInfoRow(
              context,
              AppStrings.windSpeed,
              '${wind.speed.toStringAsFixed(1)} ${AppStrings.meterPerSecond}',
              Icons.air,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherInfoRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}