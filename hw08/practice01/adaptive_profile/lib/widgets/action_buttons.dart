import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildPrimaryButton(),
        _buildSecondaryButton(),
      ],
    );
  }

  Widget _buildPrimaryButton() {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        side: const BorderSide(color: AppColors.buttonPurple, width: 1),
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.buttonPaddingVertical,
          horizontal: AppDimens.buttonPaddingHorizontal,
        ),
        minimumSize: const Size(
          AppDimens.buttonMinWidth,
          AppDimens.buttonMinHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusLarge),
        ),
      ),
      child: const Text(
        'Редактировать',
        style: AppTextStyles.buttonText,
      ),
    );
  }

  Widget _buildSecondaryButton() {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.white,
        side: const BorderSide(color: AppColors.buttonPurple, width: 1),
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.buttonPaddingVertical,
          horizontal: AppDimens.buttonPaddingHorizontal,
        ),
        minimumSize: const Size(
          AppDimens.buttonMinWidth,
          AppDimens.buttonMinHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusLarge),
        ),
      ),
      child: const Text(
        'Поделиться',
        style: AppTextStyles.buttonText,
      ),
    );
  }
}
