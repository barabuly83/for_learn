// Константы приложения
import 'package:flutter/material.dart';

class AppColors {
  // 5 основных цветов по эскизу

  // 1. Голубой - для шапки и фона изображений
  static const Color bannerBlue =
      Color(0xFFC2D9F8); // Голубой (RGB: 194, 221, 248)

  // 2. Фиолетовый - для аватара и кнопок
  static const Color avatarPurple =
      Color(0xFFE1BEE7); // Светло-фиолетовый аватар
  static const Color buttonPurple = Color(0xFF9C27B0); // Фиолетовый для кнопок
  static const Color buttonBackground =
      Color(0xFFF3E5F5); // Светло-фиолетовый фон кнопок

  // 3. Синий - для текста на изображениях
  static const Color imageText =
      Color(0xFF2196F3); // Синий для текста "Изображение X"
  static const Color primary = Color(0xFF2196F3); // Синий для FAB
  static const Color primaryDark = Color(0xFF1976D2);

  // 4. Черный - для текстов и иконок
  static const Color black = Colors.black;
  static const Color textPrimary =
      Color(0xFF212121); // Темно-серый (почти черный)

  // 5. Серый - для других элементов
  static const Color textSecondary = Color(0xFF757575); // Серый текст
  static const Color statsBackground =
      Color(0xFFF5F5F5); // Светло-серый фон статистики
  static const Color borderGrey =
      Color(0xFFE0E0E0); // Серый для границ (grey[300])
  static const Color shadowLight = Color(0x1A000000); // Черный с opacity 0.1
  static const Color shadowVeryLight =
      Color(0x0D000000); // Черный с opacity 0.05

  // Дополнительные
  static const Color white = Colors.white; // Белый цвет
  static const Color background = Colors.white; // Белый фон приложения
  static const Color online = Color(0xFF4CAF50);
}

class AppTextStyles {
  static const TextStyle titleLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const TextStyle statValue = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle statLabel = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
}

class AppDimens {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double avatarSizeLarge = 120.0;
  static const double avatarSizeSmall = 100.0;
  static const double breakpointWidth = 600.0;
}
