import 'package:flutter/material.dart';
import 'views/home_screen.dart';
import 'views/second_screen.dart';
import 'views/third_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator 1.0 Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const HomeScreen());
          case '/second':
            return MaterialPageRoute(builder: (_) => const SecondScreen());
          case '/third':
            return MaterialPageRoute(builder: (_) => const ThirdScreen());
          default:
            return null;
        }
      },
    );
  }
}