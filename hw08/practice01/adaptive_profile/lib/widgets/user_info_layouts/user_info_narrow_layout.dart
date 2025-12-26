import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'base_user_info_layout.dart';

class UserInfoNarrowLayout extends BaseUserInfoLayout {
  const UserInfoNarrowLayout({
    super.key,
    required super.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppDimens.avatarSizeSmall / 2),
        Text(
          user.name,
          style: AppTextStyles.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimens.paddingSmall),
        Text(
          user.profession,
          style: AppTextStyles.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

