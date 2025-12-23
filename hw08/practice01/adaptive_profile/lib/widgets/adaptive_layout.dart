import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AdaptiveLayout extends StatelessWidget {
  final bool isWideScreen;
  final Widget header;
  final Widget userInfo;
  final Widget stats;
  final Widget additionalInfo;
  final Widget actionButtons;

  const AdaptiveLayout({
    super.key,
    required this.isWideScreen,
    required this.header,
    required this.userInfo,
    required this.stats,
    required this.additionalInfo,
    required this.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          const SizedBox(height: AppDimens.paddingLarge),
          userInfo,
          const SizedBox(height: AppDimens.paddingLarge),
          stats,
          const SizedBox(height: AppDimens.paddingLarge),
          additionalInfo,
          const SizedBox(height: AppDimens.paddingLarge * 2), // Удвоенный отступ вместо Spacer
          actionButtons,
        ],
      ),
    );
  }
}