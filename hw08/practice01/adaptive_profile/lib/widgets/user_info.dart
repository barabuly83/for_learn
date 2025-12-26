import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'user_info_layouts/base_user_info_layout.dart';
import 'user_info_layouts/user_info_wide_layout.dart';
import 'user_info_layouts/user_info_narrow_layout.dart';

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
    final BaseUserInfoLayout layout = isWideScreen
        ? UserInfoWideLayout(user: user)
        : UserInfoNarrowLayout(user: user);

    return layout;
  }
}
