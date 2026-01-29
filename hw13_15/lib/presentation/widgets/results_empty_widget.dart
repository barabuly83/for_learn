import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';

class ResultsEmptyWidget extends StatelessWidget {
  const ResultsEmptyWidget({super.key});

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
              Icons.history,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              l10n?.no_quiz_history ?? 'История викторин пуста',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              l10n?.no_quiz_history_desc ??
                  'Пройдите свою первую викторину, чтобы увидеть результаты здесь',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}