import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'news_feed_widget.dart';

class AdaptiveLayout extends StatelessWidget {
  final bool isWideScreen;
  final Widget header;
  final Widget userInfo;
  final Widget stats;
  final Widget actionButtons;

  const AdaptiveLayout({
    super.key,
    required this.isWideScreen,
    required this.header,
    required this.userInfo,
    required this.stats,
    required this.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: isWideScreen ? _buildWideLayout() : _buildNarrowLayout(),
    );
  }

  // Горизонтальная верстка (планшет/широкий экран)
  Widget _buildWideLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDimens.paddingSmall),
          Stack(
            clipBehavior: Clip.none,
            children: [
              header,
              Positioned(
                left: 16,
                bottom: -AppDimens.avatarSizeLarge / 2,
                child: Container(
                  width: AppDimens.avatarSizeLarge,
                  height: AppDimens.avatarSizeLarge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.avatarPurple,
                    border: Border.all(
                      color: AppColors.white,
                      width: 4,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16 + AppDimens.avatarSizeLarge + 16,
                bottom: -AppDimens.avatarSizeLarge / 2 - 20,
                child: userInfo,
              ),
            ],
          ),
          SizedBox(
            height: _calculateStatsOffset(),
          ),
          stats,
          const SizedBox(height: AppDimens.paddingLarge),
          actionButtons,
          SizedBox(height: AppDimens.paddingLarge * 2),
          NewsFeedWidget(isWideScreen: isWideScreen),
          const SizedBox(height: AppDimens.paddingLarge),
        ],
      ),
    );
  }

  double _calculateStatsOffset() {
    const double userInfoHeight = 40.0;
    double userInfoBottom = AppDimens.avatarSizeLarge / 2 - 20 + userInfoHeight;
    const double minGap = AppDimens.paddingMedium;
    double baseOffset = AppDimens.avatarSizeLarge / 2;
    double calculatedOffset = userInfoBottom + minGap;
    return (calculatedOffset > baseOffset ? calculatedOffset : baseOffset) +
        4.0;
  }

  // Вертикальная верстка (телефон)
  Widget _buildNarrowLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDimens.paddingSmall),
          header,
          const SizedBox(height: AppDimens.paddingLarge),
          Center(child: userInfo),
          const SizedBox(height: AppDimens.paddingLarge),
          stats,
          const SizedBox(height: AppDimens.paddingLarge),
          actionButtons,
          SizedBox(height: AppDimens.paddingLarge * 2),
          NewsFeedWidget(isWideScreen: isWideScreen),
          const SizedBox(height: AppDimens.paddingLarge),
        ],
      ),
    );
  }
}
