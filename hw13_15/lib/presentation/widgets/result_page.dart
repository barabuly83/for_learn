import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/router/routes/result_route.dart';
import '../../app/router/routes/result_argument.dart';
import '../../app/router/routes/app_screens.dart';
import '../../domain/models/firestore_service.dart';
import '../../l10n/l10n.dart';

class ResultPage extends StatefulWidget {
  final GoRouterState state;

  const ResultPage({super.key, required this.state});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final FirestoreService _firestoreService = FirestoreService(
    FirebaseFirestore.instance,
  );

  @override
  void initState() {
    super.initState();
    _saveQuizResult();
  }

  Future<void> _saveQuizResult() async {
    // print('🔄 Starting _saveQuizResult...');

    try {
      final user = FirebaseAuth.instance.currentUser;
      // print('Current user: ${user?.email ?? 'null'}');

      if (user == null) {
        // print('❌ User not authenticated, skipping save');
        return;
      }

      final Map<String, dynamic> queryParameters = Map<String, String>.from(
        widget.state.uri.queryParameters,
      );
      // print('Query parameters: $queryParameters');

      final ResultArgument arguments = ResultRoute.withResultArgument(
        queryParameters,
      );
      // print('Parsed arguments: category=${arguments.category}, correctAnswers=${arguments.correctAnswers}');

      try {
        // print('📝 Saving quiz result to Firestore...');
        await _firestoreService.saveQuizResult(
          userId: user.uid,
          category: arguments.category,
          score: int.parse(arguments.correctAnswers),
          totalQuestions:
              10, // Пока фиксированное значение, можно расширить ResultArgument позже
          timeSpent: const Duration(
            minutes: 5,
          ), // Пока фиксированное значение, можно расширить ResultArgument позже
        );

        // print('✅ Quiz result saved successfully!');
        // Можно добавить уведомление о успешном сохранении
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Результат сохранен!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        // Обработка ошибки
        // print('❌ Error saving quiz result: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ошибка сохранения: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      // print('❌ Unexpected error in _saveQuizResult: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Неожиданная ошибка при сохранении'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final Map<String, dynamic> queryParameters = Map<String, String>.from(
      widget.state.uri.queryParameters,
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
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.history),
                label: const Text(
                  'Все результаты',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  // print('🔗 Navigating to results page: ${AppScreens.results.routePath}');
                  try {
                    context.push(AppScreens.results.routePath);
                    // print('✅ Navigation successful');
                  } catch (e) {
                    // print('❌ Navigation failed: $e');
                  }
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.home),
                label: Text(
                  l10n?.main ?? 'Главная',
                  style: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  context.go(AppScreens.home.routePath);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
