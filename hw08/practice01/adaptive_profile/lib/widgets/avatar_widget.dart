import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AvatarWidget extends StatelessWidget {
  final double size;
  final bool showBorder;

  const AvatarWidget({
    super.key,
    required this.size,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.avatarPurple,
        border: showBorder
            ? Border.all(
                color: AppColors.white,
                width: AppDimens.avatarBorderWidth,
              )
            : null,
      ),
    );
  }
}
