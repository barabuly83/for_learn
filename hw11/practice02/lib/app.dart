import 'package:flutter/material.dart';
import 'providers/theme_manager.dart';
import 'providers/theme_provider.dart';
import 'views/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      child: Builder(
        builder: (context) {
          final themeProvider = ThemeProvider.of(context);

          return MaterialApp(
            title: 'Theme Switcher',
            theme: ThemeData.light(
              useMaterial3: true,
            ).copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: Brightness.light,
              ),
            ),
            darkTheme: ThemeData.dark(
              useMaterial3: true,
            ).copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: Brightness.dark,
              ),
            ),
            themeMode: themeProvider?.themeMode ?? ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}