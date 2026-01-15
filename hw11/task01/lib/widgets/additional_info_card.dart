import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AdditionalInfoCard extends StatelessWidget {
  const AdditionalInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppConstants.additionalInfoTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Это демонстрационный контакт для учебного приложения. '
              'Здесь может отображаться дополнительная информация о сотруднике, '
              'такая как отдел, дата приема на работу, проекты и достижения.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Добавлен: 13.01.2026',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.group,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Отдел: Разработка',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}