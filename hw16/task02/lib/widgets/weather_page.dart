import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';
import 'weather_display.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Погода'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'Введите название города',
                  border: OutlineInputBorder(),
                  hintText: 'Например: Москва, Санкт-Петербург',
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.words,
                autocorrect: false,
                onSubmitted: (_) => _fetchWeather(),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _fetchWeather,
                      child: const Text('Получить погоду'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      _cityController.clear();
                      FocusScope.of(context).unfocus();
                    },
                    icon: const Icon(Icons.clear),
                    tooltip: 'Очистить',
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherInitial) {
                      return const Center(
                        child: Text(
                          'Введите город и нажмите кнопку для получения погоды',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    } else if (state is WeatherLoading) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text('Загрузка данных о погоде...'),
                          ],
                        ),
                      );
                    } else if (state is WeatherLoaded) {
                      return WeatherDisplay(weather: state.weather);
                    } else if (state is WeatherError) {
                      return const Center(
                        child: Text(
                          'Произошла ошибка при загрузке данных',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _fetchWeather() {
    final cityName = _cityController.text.trim();
    if (cityName.isNotEmpty) {
      // Скрываем клавиатуру
      FocusScope.of(context).unfocus();
      context.read<WeatherBloc>().add(FetchWeather(cityName));
    } else {
      // Показываем сообщение если город не введен
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Пожалуйста, введите название города'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }
}
