import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const ActionButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
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

