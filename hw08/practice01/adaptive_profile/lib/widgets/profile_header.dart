import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ProfileHeader extends StatelessWidget {
  final bool isWideScreen;

  const ProfileHeader({
    super.key,
    required this.isWideScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: isWideScreen
              ? AppDimens.bannerHeightWide
              : AppDimens.bannerHeightNarrow,
          decoration: BoxDecoration(
            color: AppColors.bannerBlue,
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
          ),
        ),
        if (!isWideScreen)
          Positioned(
            bottom: -AppDimens.avatarSizeSmall / 2,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: AppDimens.avatarSizeSmall,
                height: AppDimens.avatarSizeSmall,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.avatarPurple,
                  border: Border.all(
                    color: AppColors.white,
                    width: AppDimens.avatarBorderWidth,
                  ),
                ),
              ),
            ),
          ),
        Positioned(
          top: AppDimens.paddingMedium,
          left: AppDimens.paddingMedium,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: AppDimens.shadowBlurSmall,
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ],
    );
  }
}
