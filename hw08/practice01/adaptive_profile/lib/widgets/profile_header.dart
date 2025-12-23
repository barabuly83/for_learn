import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ProfileHeader extends StatelessWidget {
  final bool isWideScreen;

  const ProfileHeader({
    super.key,
    required this.isWideScreen,
  });

  @override
  Widget build(BuildContext context) {
    final double headerHeight = isWideScreen ? 200 : 150;
    final double bannerHeight = isWideScreen ? 140 : 100;

    return SizedBox(
      height: headerHeight,
      child: Stack(
        children: [
          // Фоновый баннер
          _buildBanner(bannerHeight),
          
          // Кнопка "Назад"
          _buildBackButton(),
          
          // Кнопка настроек
          _buildSettingsButton(),
        ],
      ),
    );
  }

  Widget _buildBanner(double height) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF64B5F6), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget _buildBackButton() {
    return const Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: CircleButton(
          icon: Icons.arrow_back,
          onPressed: null,
        ),
      ),
    );
  }

  Widget _buildSettingsButton() {
    return const Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: CircleButton(
          icon: Icons.settings,
          onPressed: null,
        ),
      ),
    );
  }
}

// Вспомогательный виджет для круглых кнопок
class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CircleButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}