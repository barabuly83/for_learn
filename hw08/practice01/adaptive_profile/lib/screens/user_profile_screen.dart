import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/user_info.dart';
import '../widgets/user_stats.dart';
import '../widgets/action_buttons.dart';
import '../widgets/adaptive_layout.dart';
import '../widgets/custom_floating_action_button.dart';
import '../data/user_data.dart';
import '../utils/constants.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > AppDimens.breakpointWidth;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SafeArea(
            child: AdaptiveLayout(
              isWideScreen: isWideScreen,
              header: ProfileHeader(isWideScreen: isWideScreen),
              userInfo: UserInfo(
                isWideScreen: isWideScreen,
                user: UserData.currentUser,
              ),
              stats: UserStatsWidget(
                isWideScreen: isWideScreen,
                stats: UserData.currentUser.stats,
              ),
              actionButtons: const ActionButtons(),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.paddingMedium),
                child: const CustomFloatingActionButton(
                  onPressed: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
