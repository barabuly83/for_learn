import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import '../widgets/locally_themed_button.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    final isDarkMode = themeProvider?.themeMode == ThemeMode.dark;
    final themeName = isDarkMode ? 'Тёмная' : 'Светлая';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Главный экран'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Текущая тема: $themeName',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: themeProvider?.toggleTheme,
              child: const Text('Переключить тему'),
            ),
            const SizedBox(height: 30),
            // Отдельный виджет с локальными изменениями темы
            LocallyThemedButton(
              text: 'Кнопка с локальной темой',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Кнопка с локальной темой нажата!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}