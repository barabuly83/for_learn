import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/layout_calculator.dart';
import '../news_feed_widget.dart';
import '../avatar_widget.dart';
import 'base_layout.dart';

class WideLayout extends BaseLayout {
  const WideLayout({
    super.key,
    required super.header,
    required super.userInfo,
    required super.stats,
    required super.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
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
          const NewsFeedWidget(isWideScreen: true),
          const SizedBox(height: AppDimens.paddingLarge),
        ],
      ),
    );
  }
}

