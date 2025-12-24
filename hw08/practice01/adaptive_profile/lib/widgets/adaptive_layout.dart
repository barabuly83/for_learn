import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/layout_calculator.dart';
import 'news_feed_widget.dart';
import 'avatar_widget.dart';

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
                left: AppDimens.paddingMedium,
                bottom: -AppDimens.avatarSizeLarge / 2,
                child: AvatarWidget(size: AppDimens.avatarSizeLarge),
              ),
              Positioned(
                left: AppDimens.paddingMedium +
                    AppDimens.avatarSizeLarge +
                    AppDimens.paddingMedium,
                bottom: -AppDimens.avatarSizeLarge / 2 -
                    AppDimens.userInfoVerticalOffset,
                child: userInfo,
              ),
            ],
          ),
          SizedBox(
            height: LayoutCalculator.calculateStatsOffset(),
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
