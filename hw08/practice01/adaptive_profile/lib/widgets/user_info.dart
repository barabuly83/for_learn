import 'package:flutter/material.dart';
import '../utils/constants.dart';

class UserInfo extends StatelessWidget {
  final bool isWideScreen;

  const UserInfo({
    super.key,
    required this.isWideScreen,
  });

  @override
  Widget build(BuildContext context) {
    return isWideScreen ? _buildWideLayout() : _buildNarrowLayout();
  }

  Widget _buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Аватар для широкого экрана
        Container(
          width: AppDimens.avatarSizeLarge,
          height: AppDimens.avatarSizeLarge,
          margin: const EdgeInsets.only(right: 24),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=400',
            ),
            radius: 60,
          ),
        ),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Имя
              Text(
                'Александр Иванов',
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(height: AppDimens.paddingSmall),
              
              // Местоположение
              _buildLocation(),
              const SizedBox(height: AppDimens.paddingSmall),
              
              // Статус
              _buildStatus(),
              const SizedBox(height: AppDimens.paddingMedium),
              
              // Описание
              _buildDescription(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Аватар для узкого экрана
        Container(
          width: AppDimens.avatarSizeSmall,
          height: AppDimens.avatarSizeSmall,
          margin: const EdgeInsets.only(bottom: AppDimens.paddingMedium),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=400',
            ),
            radius: 50,
          ),
        ),
        
        // Имя
        Text(
          'Александр Иванов',
          style: AppTextStyles.titleMedium,
        ),
        const SizedBox(height: AppDimens.paddingSmall),
        
        // Местоположение
        _buildLocation(),
        const SizedBox(height: AppDimens.paddingSmall),
        
        // Статус
        _buildStatus(),
        const SizedBox(height: AppDimens.paddingMedium),
        
        // Описание
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
          child: _buildDescription(),
        ),
      ],
    );
  }

  Widget _buildLocation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          'Москва, Россия',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green[100]!),
          ),
          child: Text(
            'Онлайн',
            style: TextStyle(
              color: AppColors.online,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.circle, color: Colors.green, size: 8),
        const SizedBox(width: 4),
        Text(
          'был(а) только что',
          style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey[500]),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      'Дизайнер интерфейсов, любитель фотографии и путешествий. '
      'Работаю в IT-компании 5 лет.',
      textAlign: TextAlign.center,
      style: AppTextStyles.bodyLarge,
    );
  }
}