import 'package:flutter/material.dart';
import '../utils/constants.dart';

class UserStats extends StatelessWidget {
  final bool isWideScreen;

  const UserStats({super.key, this.isWideScreen = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: isWideScreen 
            ? MainAxisAlignment.spaceAround 
            : MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem('2.5K', 'Подписчики', Icons.people),
          _buildDivider(),
          _buildStatItem('348', 'Подписки', Icons.group),
          _buildDivider(),
          _buildStatItem('127', 'Посты', Icons.post_add),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              value,
              style: AppTextStyles.statValue,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.statLabel,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.grey[300],
    );
  }
}