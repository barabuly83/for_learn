import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';

class CategoriesErrorWidget extends StatelessWidget {
  final String? error;
  final VoidCallback onRetry;

  const CategoriesErrorWidget({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              l10n?.error_loading_categories ?? 'Ошибка загрузки категорий',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              error!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: Text(
                (error?.contains('Rate limit') == true || error?.contains('429') == true)
                    ? 'Повторить через 2 мин'
                    : (l10n?.retry ?? 'Повторить'),
              ),
              onPressed: () async {
                if (error?.contains('Rate limit') == true || error?.contains('429') == true) {
                  // Ждем 2 минуты перед повтором при rate limit
                  await Future<void>.delayed(const Duration(minutes: 2));
                }
                onRetry();
              },
            ),
          ],
        ),
      ),
    );
  }
}