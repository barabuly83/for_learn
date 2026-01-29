import 'package:flutter/material.dart';
import '../../models/quiz_result.dart';

class ResultsListWidget extends StatelessWidget {
  final List<QuizResult> results;
  final VoidCallback onRefresh;

  const ResultsListWidget({
    super.key,
    required this.results,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          return _QuizResultCard(result: result);
        },
      ),
    );
  }
}

class _QuizResultCard extends StatelessWidget {
  final QuizResult result;

  const _QuizResultCard({required this.result});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Определяем цвет карточки в зависимости от процента правильных ответов
    Color cardColor;
    Color textColor;

    if (result.percentage >= 80) {
      cardColor = colorScheme.primaryContainer;
      textColor = colorScheme.onPrimaryContainer;
    } else if (result.percentage >= 60) {
      cardColor = colorScheme.secondaryContainer;
      textColor = colorScheme.onSecondaryContainer;
    } else {
      cardColor = colorScheme.errorContainer;
      textColor = colorScheme.onErrorContainer;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              cardColor.withValues(alpha: 0.8),
              cardColor.withValues(alpha: 0.4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      result.category,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: textColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${result.percentage}%',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 20,
                    color: textColor.withValues(alpha: 0.8),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${result.score}/${result.totalQuestions}',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: textColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.timer,
                    size: 20,
                    color: textColor.withValues(alpha: 0.8),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    result.timeSpentFormatted,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                result.dateFormatted,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: textColor.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}