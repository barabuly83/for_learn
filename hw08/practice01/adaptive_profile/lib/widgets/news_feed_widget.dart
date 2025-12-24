import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../data/news_data.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String date;
  final int imageIndex;

  const NewsCard({
    super.key,
    required this.title,
    required this.date,
    required this.imageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Область изображения - 2/3 высоты карточки
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.bannerBlue, // Голубой фон как баннер
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  'Изображение ${imageIndex + 1}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.imageText, // Синий текст по эскизу
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          // Контент - 1/3 высоты карточки
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Заголовок
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Дата
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 10,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsFeedWidget extends StatelessWidget {
  final bool isWideScreen;

  const NewsFeedWidget({
    super.key,
    required this.isWideScreen,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppDimens.paddingMedium,
            ),
            child: isWideScreen
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Лента новостей',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon:
                              Icon(Icons.more_horiz, color: AppColors.primary),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      'Лента новостей',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: AppDimens.paddingMedium,
                  mainAxisSpacing: AppDimens.paddingMedium,
                  childAspectRatio: 0.75,
                ),
                itemCount: NewsData.items.length,
                itemBuilder: (context, index) {
                  final news = NewsData.items[index];
                  return NewsCard(
                    title: news.title,
                    date: news.date,
                    imageIndex: index,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
