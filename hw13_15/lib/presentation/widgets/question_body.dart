import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';
import '../../models/model.dart';
import 'answer_option_widget.dart';
import 'question_navigation_buttons.dart';

class QuestionBody extends StatelessWidget {
  final Question question;
  final S? l10n;
  final int currentQuestionIndex;
  final int totalQuestions;
  final Map<int, Set<String>> selectedAnswers;
  final void Function(String) onAnswerSelected;
  final bool Function(String) isAnswerSelected;
  final VoidCallback onPreviousQuestion;
  final VoidCallback onNextQuestion;

  const QuestionBody({
    super.key,
    required this.question,
    required this.l10n,
    required this.currentQuestionIndex,
    required this.totalQuestions,
    required this.selectedAnswers,
    required this.onAnswerSelected,
    required this.isAnswerSelected,
    required this.onPreviousQuestion,
    required this.onNextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (question.description?.isNotEmpty == true) ...[
            const SizedBox(height: 8),
            Text(
              question.description!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          const SizedBox(height: 24),
          ..._buildAnswerOptions(),
          const SizedBox(height: 24),
          QuestionNavigationButtons(
            l10n: l10n,
            currentQuestionIndex: currentQuestionIndex,
            totalQuestions: totalQuestions,
            onPreviousQuestion: onPreviousQuestion,
            onNextQuestion: onNextQuestion,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAnswerOptions() {
    final options = <Widget>[];

    final answerKeys = ['answer_a', 'answer_b', 'answer_c', 'answer_d', 'answer_e', 'answer_f'];
    final answers = [
      question.answers.answerA,
      question.answers.answerB,
      question.answers.answerC,
      question.answers.answerD,
      question.answers.answerE,
      question.answers.answerF,
    ];

    for (var i = 0; i < answerKeys.length; i++) {
      final answer = answers[i];
      if (answer != null) {
        options.add(
          AnswerOptionWidget(
            key: ValueKey(answerKeys[i]), // Добавляем key для оптимизации
            answerKey: answerKeys[i],
            answerText: answer,
            isSelected: isAnswerSelected(answerKeys[i]),
            isMultiple: question.multipleCorrectAnswers == 'true',
            onTap: () => onAnswerSelected(answerKeys[i]),
          ),
        );
      }
    }

    return options;
  }
}