import 'package:flutter/material.dart';
import '../widgets/news_card.dart';
import '../utils/constants.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  // Пример данных (в реальном приложении будет API)
  final List<Map<String, String>> newsItems = const [
    {
      'title': 'Flutter 3.0 вышла с поддержкой macOS и Linux',
      'date': '15.12.2023',
    },
    {
      'title': 'Dart 3.0: Новые возможности языка',
      'date': '14.12.2023',
    },
    {
      'title': 'Адаптивный дизайн в мобильных приложениях',
      'date': '13.12.2023',
    },
    {
      'title': 'State Management в Flutter: сравнение подходов',
      'date': '12.12.2023',
    },
    {
      'title': 'Производительность в Flutter: лучшие практики',
      'date': '11.12.2023',
    },
    {
      'title': 'Создание анимаций с помощью Flutter',
      'date': '10.12.2023',
    },
    {
      'title': 'Интеграция Firebase в Flutter приложение',
      'date': '09.12.2023',
    },
    {
      'title': 'Тестирование Flutter приложений: полное руководство',
      'date': '08.12.2023',
    },
    {
      'title': 'Flutter для веба: что нового?',
      'date': '07.12.2023',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Основной контент
            Column(
              children: [
                // Заголовок ленты
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    AppDimens.paddingMedium,
                    AppDimens.paddingMedium,
                    AppDimens.paddingMedium,
                    AppDimens.paddingSmall,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Лента новостей',
                          style: AppTextStyles.titleLarge.copyWith(
                            fontSize: 28,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          // Поиск
                        },
                      ),
                    ],
                  ),
                ),

                // Сетка новостей с LayoutBuilder
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Определяем количество колонок в зависимости от ширины
                      final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.paddingMedium,
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: AppDimens.paddingMedium,
                            mainAxisSpacing: AppDimens.paddingMedium,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: newsItems.length,
                          itemBuilder: (context, index) {
                            final news = newsItems[index];
                            return NewsCard(
                              title: news['title']!,
                              date: news['date']!,
                              imageIndex: index,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // Плавающая кнопка добавления
            Positioned(
              right: AppDimens.paddingMedium,
              bottom: AppDimens.paddingMedium,
              child: FloatingActionButton(
                onPressed: () {
                  // Действие при нажатии
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Добавить новую запись'),
                    ),
                  );
                },
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Icon(Icons.add, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
