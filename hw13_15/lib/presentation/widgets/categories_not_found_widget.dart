import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';

class CategoriesNotFoundWidget extends StatelessWidget {
  final VoidCallback onRefresh;

  const CategoriesNotFoundWidget({
    super.key,
    required this.onRefresh,
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
              Icons.category_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              l10n?.categories_not_found ?? 'Категории не найдены',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: Text(l10n?.refresh ?? 'Обновить'),
              onPressed: onRefresh,
            ),
          ],
        ),
      ),
    );
  }
}