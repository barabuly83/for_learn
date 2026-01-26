import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/router/routes/result_route.dart';
import '../../app/router/routes/result_argument.dart';
import '../../l10n/l10n.dart';

class ResultPage extends StatelessWidget {
  final GoRouterState state;

  const ResultPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final Map<String, dynamic> queryParameters = Map<String, String>.from(
      state.uri.queryParameters,
    );
    final ResultArgument arguments = ResultRoute.withResultArgument(
      queryParameters,
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n?.results ?? 'Результаты')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n?.category(arguments.category) ??
                  'Категория: ${arguments.category}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              l10n?.count_correct_answers(arguments.correctAnswers) ??
                  'Количество верных ответов: ${arguments.correctAnswers}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
