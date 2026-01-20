import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/models/auth_service.dart';
import '../../../domain/models/quiz_service.dart';
import '../../../l10n/l10n.dart';
import 'package:hw13_15/app/services/app_services.dart';

class QuizApp extends StatelessWidget {
  final AuthService authService;
  final QuizService quizService;
  final GoRouter router;

  const QuizApp({
    super.key,
    required this.authService,
    required this.quizService,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return AppServices(
      authService: authService,
      quizService: quizService,
      child: MaterialApp.router(
        title: 'Quiz App',
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
      ),
    );
  }
}
