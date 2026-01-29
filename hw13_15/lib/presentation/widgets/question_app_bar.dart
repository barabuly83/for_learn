import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';

class QuestionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final S? l10n;
  final int questionNumber;
  final int totalQuestions;

  const QuestionAppBar({
    super.key,
    required this.l10n,
    required this.questionNumber,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        l10n?.question(questionNumber.toString(), totalQuestions.toString()) ??
            'Вопрос $questionNumber/$totalQuestions',
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}