import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'base_user_info_layout.dart';

class UserInfoWideLayout extends BaseUserInfoLayout {
  const UserInfoWideLayout({
    super.key,
    required super.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name,
          style: AppTextStyles.titleLarge,
        ),
        const SizedBox(height: AppDimens.paddingSmall),
        Text(
          user.profession,
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }
}

