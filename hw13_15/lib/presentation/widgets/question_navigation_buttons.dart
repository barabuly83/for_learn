import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';

class QuestionNavigationButtons extends StatelessWidget {
  final S? l10n;
  final int currentQuestionIndex;
  final int totalQuestions;
  final VoidCallback onPreviousQuestion;
  final VoidCallback onNextQuestion;

  const QuestionNavigationButtons({
    super.key,
    required this.l10n,
    required this.currentQuestionIndex,
    required this.totalQuestions,
    required this.onPreviousQuestion,
    required this.onNextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: currentQuestionIndex > 0 ? onPreviousQuestion : null,
          child: Text(l10n?.back ?? 'Назад'),
        ),
        ElevatedButton(
          onPressed: onNextQuestion,
          child: Text(
            currentQuestionIndex < totalQuestions - 1
                ? (l10n?.next ?? 'Далее')
                : (l10n?.finish ?? 'Завершить'),
          ),
        ),
      ],
    );
  }
}