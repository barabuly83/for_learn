import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/weather_page.dart';
import 'themes/app_theme.dart';
import 'constants/app_strings.dart';
import 'viewmodels/weather_viewmodel.dart';
import 'services/weather_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherViewModel(),
      child: MaterialApp(
        title: AppStrings.appTitle,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const WeatherPage(),
      ),
    );
  }
}
