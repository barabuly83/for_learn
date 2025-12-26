import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../news_feed_widget.dart';
import 'base_layout.dart';

class NarrowLayout extends BaseLayout {
  const NarrowLayout({
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
          header,
          const SizedBox(height: AppDimens.paddingLarge),
          Center(child: userInfo),
          const SizedBox(height: AppDimens.paddingLarge),
          stats,
          const SizedBox(height: AppDimens.paddingLarge),
          actionButtons,
          SizedBox(height: AppDimens.paddingLarge * 2),
          const NewsFeedWidget(isWideScreen: false),
          const SizedBox(height: AppDimens.paddingLarge),
        ],
      ),
    );
  }
}

