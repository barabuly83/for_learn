import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../models/user_model.dart';

class UserStatsWidget extends StatelessWidget {
  final bool isWideScreen;
  final UserStats stats;

  const UserStatsWidget({
    super.key,
    required this.isWideScreen,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.statsBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGrey),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowVeryLight,
            blurRadius: 8,
            spreadRadius: 1,
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
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.statLabel,
        ),
      ],
    );
  }
}
