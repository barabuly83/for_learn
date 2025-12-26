import 'package:flutter/material.dart';
import '../../models/user_model.dart';

/// Базовый абстрактный виджет для layout'ов информации о пользователе
abstract class BaseUserInfoLayout extends StatelessWidget {
  final UserModel user;

  const BaseUserInfoLayout({
    super.key,
    required this.user,
  });
}

