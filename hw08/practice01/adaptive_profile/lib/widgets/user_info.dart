import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../models/user_model.dart';

class UserInfo extends StatelessWidget {
  final bool isWideScreen;
  final UserModel user;

  const UserInfo({
    super.key,
    required this.isWideScreen,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return isWideScreen ? _buildWideLayout() : _buildNarrowLayout();
  }

  Widget _buildWideLayout() {
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

  Widget _buildNarrowLayout() {
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
