import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Дополнительно',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppDimens.paddingMedium),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildChip('UI/UX дизайн', Icons.design_services),
            _buildChip('Фотография', Icons.photo_camera),
            _buildChip('Путешествия', Icons.flight_takeoff),
            _buildChip('IT', Icons.code),
            _buildChip('Искусство', Icons.palette),
          ],
        ),
      ],
    );
  }

  Widget _buildChip(String label, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      backgroundColor: Colors.blue[50],
      side: BorderSide(color: Colors.blue[100]!),
    );
  }
}