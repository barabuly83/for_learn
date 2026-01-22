import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/router/routes/result_route.dart';
import '../../app/router/routes/result_argument.dart';

class ResultPage extends StatelessWidget {
  final GoRouterState state;

  const ResultPage({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> queryParameters =
        Map<String, String>.from(state.uri.queryParameters);
    final ResultArgument arguments =
        ResultRoute.withResultArgument(queryParameters);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Category: ${arguments.category}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              'Correct Answers: ${arguments.correctAnswers}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
