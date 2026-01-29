import 'package:flutter/material.dart';

class CategoriesEmptyWidget extends StatelessWidget {
  final VoidCallback onLoadCategories;

  const CategoriesEmptyWidget({
    super.key,
    required this.onLoadCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.category_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Категории не загружены',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Нажмите кнопку для загрузки категорий из QuizAPI',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.download),
              label: const Text('Загрузить категории'),
              onPressed: onLoadCategories,
            ),
          ],
        ),
      ),
    );
  }
}