import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    final isDarkMode = themeProvider?.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки темы'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Настройки темы',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Тема приложения',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Текущая тема:'),
                        Text(
                          isDarkMode ? 'Тёмная' : 'Светлая',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.blue : Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SwitchListTile(
                      title: const Text('Тёмная тема'),
                      subtitle: const Text('Включить тёмную тему приложения'),
                      value: isDarkMode,
                      onChanged: (value) {
                        themeProvider?.toggleTheme();
                      },
                      secondary: Icon(
                        isDarkMode ? Icons.dark_mode : Icons.light_mode,
                        color: isDarkMode ? Colors.blue : Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Пример локальных изменений темы в настройках
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerTheme: const DividerThemeData(
                          color: Colors.red,
                          thickness: 2,
                        ),
                      ),
                      child: const Divider(),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Разделитель выше имеет локальные стили (красный цвет)',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Дополнительные настройки с локальной темой
            Theme(
              data: Theme.of(context).copyWith(
                cardTheme: CardThemeData(
                  color: Colors.grey[100],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.blue, width: 1),
                  ),
                ),
              ),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Дополнительные настройки',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Эта карточка имеет локальные стили:',
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        '• Серый фон',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Text(
                        '• Синяя рамка',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Text(
                        '• Скругленные углы',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}