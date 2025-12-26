import 'package:flutter/material.dart';
import '../utils/constants.dart';

class StatItem extends StatelessWidget {
  final String value;
  final String label;

  const StatItem({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
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

