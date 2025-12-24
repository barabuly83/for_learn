import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../data/news_data.dart';
import 'news_card.dart';

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
                          style: AppTextStyles.newsTitle,
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
                      style: AppTextStyles.newsTitle,
                    ),
                  ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount =
                  constraints.maxWidth > AppDimens.breakpointWidth ? 3 : 2;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: AppDimens.paddingMedium,
                  mainAxisSpacing: AppDimens.paddingMedium,
                  childAspectRatio: AppDimens.newsCardAspectRatio,
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
