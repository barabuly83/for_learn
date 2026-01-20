// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hw13_15/app/router/routes/quiz_app.dart';
import 'package:hw13_15/app/router/routes/app_router.dart';
import 'package:hw13_15/domain/auth_service.dart';
import 'package:hw13_15/domain/quiz_service.dart';

void main() {
  testWidgets('Home page smoke test', (WidgetTester tester) async {
    // Создаем моки для теста
    final authService = AuthServiceImpl(firebaseAuth: FirebaseAuth.instance);
    final quizService = QuizServiceImpl(dio: Dio());
    final router = createRouter(authService);

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      QuizApp(
        authService: authService,
        quizService: quizService,
        router: router,
      ),
    );

    // Verify that login page is displayed (initial route)
    expect(find.text('Login Page'), findsOneWidget);
  });
}
