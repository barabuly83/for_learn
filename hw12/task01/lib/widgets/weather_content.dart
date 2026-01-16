import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task01/viewmodels/weather_viewmodel.dart';
import 'package:task01/widgets/weather_card.dart';
import 'package:task01/widgets/loading_indicator.dart';
import 'package:task01/widgets/error_widget.dart';

class WeatherContent extends StatelessWidget {
  const WeatherContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const LoadingIndicator();
        }

        if (viewModel.error != null) {
          return CustomErrorWidget(
            error: viewModel.error!,
            onRetry: () {
              viewModel.fetchWeather();
            },
          );
        }

        if (viewModel.weatherData == null) {
          return const Center(child: Text('No weather data available'));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: WeatherCard(weatherData: viewModel.weatherData!),
        );
      },
    );
  }
}