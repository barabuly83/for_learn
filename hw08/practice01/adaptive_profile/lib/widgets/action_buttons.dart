import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ActionButtons extends StatelessWidget {
  final bool isWideScreen;

  const ActionButtons({
    super.key,
    required this.isWideScreen,
  });

  @override
  Widget build(BuildContext context) {
    return isWideScreen ? _buildWideLayout() : _buildNarrowLayout();
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
        Expanded(
          child: _buildPrimaryButton(),
        ),
        const SizedBox(width: AppDimens.paddingMedium),
        Expanded(
          child: _buildSecondaryButton(),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      children: [
        _buildPrimaryButton(),
        const SizedBox(height: AppDimens.paddingMedium),
        _buildSecondaryButton(),
      ],
    );
  }

  Widget _buildPrimaryButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat, size: 20),
            SizedBox(width: 8),
            Text('Написать сообщение'),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondaryButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle_outline, size: 20),
            SizedBox(width: 8),
            Text('Подписаться'),
          ],
        ),
      ),
    );
  }
}