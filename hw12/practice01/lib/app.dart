import 'package:flutter/material.dart';
import 'pages/users_page.dart';
import 'constants/app_strings.dart';
import 'themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const UsersPage(),
    );
  }
}