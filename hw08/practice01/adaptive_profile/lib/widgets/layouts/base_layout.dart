import 'package:flutter/material.dart';

/// Базовый абстрактный виджет для layout'ов
abstract class BaseLayout extends StatelessWidget {
  final Widget header;
  final Widget userInfo;
  final Widget stats;
  final Widget actionButtons;

  const BaseLayout({
    super.key,
    required this.header,
    required this.userInfo,
    required this.stats,
    required this.actionButtons,
  });
}

