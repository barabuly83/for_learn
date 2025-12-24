import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomFloatingActionButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.fabSize,
      height: AppDimens.fabSize,
      decoration: BoxDecoration(
        color: AppColors.buttonBackground,
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: AppDimens.shadowBlurMedium,
            offset: Offset(0, AppDimens.shadowOffsetY),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
          child: Center(
            child: Icon(
              Icons.add,
              color: AppColors.textSecondary,
              size: AppDimens.iconSizeMedium,
            ),
          ),
        ),
      ),
    );
  }
}
