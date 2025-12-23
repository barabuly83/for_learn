import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/user_info.dart';
import '../widgets/user_stats.dart';
import '../widgets/additional_info.dart';
import '../widgets/action_buttons.dart';
import '../widgets/adaptive_layout.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWideScreen = constraints.maxWidth > 600;
            
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: AdaptiveLayout(
                isWideScreen: isWideScreen,
                header: ProfileHeader(isWideScreen: isWideScreen),
                userInfo: UserInfo(isWideScreen: isWideScreen),
                stats: const UserStats(),
                additionalInfo: const AdditionalInfo(),
                actionButtons: ActionButtons(isWideScreen: isWideScreen),
              ),
            );
          },
        ),
      ),
    );
  }
}