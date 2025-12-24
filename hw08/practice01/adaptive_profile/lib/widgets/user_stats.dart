import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../models/user_model.dart';

class UserStatsWidget extends StatelessWidget {
  final UserStats stats;

  const UserStatsWidget({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.paddingLarge,
        horizontal: AppDimens.paddingMedium,
      ),
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.statsBackground,
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        border: Border.all(color: AppColors.borderGrey),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowVeryLight,
            blurRadius: AppDimens.shadowBlurMedium,
            spreadRadius: AppDimens.shadowSpreadSmall,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: _buildStatItem(stats.subscribers, 'Подписчики'),
            ),
          ),
          Expanded(
            child: Center(
              child: _buildStatItem(stats.subscriptions, 'Подписки'),
            ),
          ),
          Expanded(
            child: Center(
              child: _buildStatItem(stats.posts, 'Посты'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.statValue,
        ),
        const SizedBox(height: AppDimens.paddingXSmall),
        Text(
          label,
          style: AppTextStyles.statLabel,
        ),
      ],
    );
  }
}
