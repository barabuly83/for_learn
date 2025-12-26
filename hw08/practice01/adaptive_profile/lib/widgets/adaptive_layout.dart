import 'package:flutter/material.dart';
import 'layouts/base_layout.dart';
import 'layouts/wide_layout.dart';
import 'layouts/narrow_layout.dart';

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
    final BaseLayout layout = isWideScreen
        ? WideLayout(
            header: header,
            userInfo: userInfo,
            stats: stats,
            actionButtons: actionButtons,
          )
        : NarrowLayout(
            header: header,
            userInfo: userInfo,
            stats: stats,
            actionButtons: actionButtons,
          );

    return SingleChildScrollView(
      child: layout,
    );
  }
}
