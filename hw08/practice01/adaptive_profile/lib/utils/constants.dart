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

  // Стили для новостей
  static const TextStyle newsTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle newsImageText = TextStyle(
    fontSize: 16,
    color: AppColors.imageText,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle newsCardTitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle newsCardDate = TextStyle(
    fontSize: 10,
    color: AppColors.textSecondary,
  );

  // Стили для кнопок
  static const TextStyle buttonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.buttonPurple,
  );
}

class AppDimens {
  // Отступы
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXSmall = 4.0;

  // Размеры аватаров
  static const double avatarSizeLarge = 120.0;
  static const double avatarSizeSmall = 100.0;
  static const double avatarBorderWidth = 4.0;

  // Размеры кнопок
  static const double buttonMinWidth = 140.0;
  static const double buttonMinHeight = 40.0;
  static const double buttonPaddingVertical = 8.0;
  static const double buttonPaddingHorizontal = 20.0;

  // Радиусы скругления
  static const double borderRadiusSmall = 12.0;
  static const double borderRadiusMedium = 16.0;
  static const double borderRadiusLarge = 30.0;

  // Высоты баннеров
  static const double bannerHeightWide = 130.0;
  static const double bannerHeightNarrow = 110.0;

  // Позиционирование и отступы
  static const double userInfoVerticalOffset = 20.0;
  static const double userInfoHeight = 40.0;
  static const double statsOffsetSafetyMargin = 4.0;

  // Тени
  static const double shadowBlurSmall = 4.0;
  static const double shadowBlurMedium = 8.0;
  static const double shadowSpreadSmall = 1.0;
  static const double shadowOffsetY = 4.0;

  // Карточки
  static const double cardElevation = 2.0;
  static const double newsCardAspectRatio = 0.75;
  static const double newsCardContentPaddingVertical = 6.0;

  // Иконки
  static const double iconSizeSmall = 10.0;
  static const double iconSizeMedium = 28.0;

  // FAB
  static const double fabSize = 56.0;

  // Адаптивность
  static const double breakpointWidth = 600.0;
}
