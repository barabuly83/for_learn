import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task01/viewmodels/weather_viewmodel.dart';
import 'package:task01/widgets/weather_card.dart';
import 'package:task01/widgets/loading_indicator.dart';
import 'package:task01/widgets/error_widget.dart';
import 'package:task01/constants/app_strings.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    // Load weather data on startup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherViewModel>().fetchWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appTitle)),
      body: _buildWeatherContent(),
    );
  }

  Widget _buildWeatherContent() {
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