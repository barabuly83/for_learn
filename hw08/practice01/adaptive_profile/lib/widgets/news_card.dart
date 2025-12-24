import 'package:flutter/material.dart';
import '../utils/constants.dart';

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
      elevation: AppDimens.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.bannerBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimens.borderRadiusSmall),
                  topRight: Radius.circular(AppDimens.borderRadiusSmall),
                ),
              ),
              child: Center(
                child: Text(
                  'Изображение ${imageIndex + 1}',
                  style: AppTextStyles.newsImageText,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingSmall,
                vertical: 6.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: AppTextStyles.newsCardTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: AppDimens.paddingXSmall),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: AppDimens.iconSizeSmall,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: AppDimens.paddingXSmall),
                      Text(
                        date,
                        style: AppTextStyles.newsCardDate,
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
