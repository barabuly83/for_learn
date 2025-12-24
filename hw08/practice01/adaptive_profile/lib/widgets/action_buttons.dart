import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(
          text: 'Редактировать',
          backgroundColor: AppColors.buttonBackground,
        ),
        _buildButton(
          text: 'Поделиться',
          backgroundColor: AppColors.white,
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required Color backgroundColor,
  }) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
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
      child: Text(
        text,
        style: AppTextStyles.buttonText,
      ),
    );
  }
}
