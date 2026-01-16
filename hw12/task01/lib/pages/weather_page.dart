import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task01/viewmodels/weather_viewmodel.dart';
import 'package:task01/widgets/weather_content.dart';
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
      body: const WeatherContent(),
    );
  }
}
