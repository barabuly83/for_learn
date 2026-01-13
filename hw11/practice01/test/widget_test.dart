import 'package:flutter_test/flutter_test.dart';

import 'package:practice01/app.dart';

void main() {
  testWidgets('HomeScreen displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that HomeScreen is displayed
    expect(find.text('Главный экран'), findsOneWidget);
    expect(find.text('Добро пожаловать на Главный экран!'), findsOneWidget);
    expect(find.text('Перейти на Второй экран'), findsOneWidget);
  });

  testWidgets('Navigation from HomeScreen to SecondScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the button to navigate to SecondScreen
    await tester.tap(find.text('Перейти на Второй экран'));
    await tester.pumpAndSettle();

    // Verify that SecondScreen is displayed
    expect(find.text('Второй экран'), findsOneWidget);
    expect(find.text('Вы на Втором экране!'), findsOneWidget);
    expect(find.text('Перейти на Третий экран'), findsOneWidget);
    expect(find.text('Назад'), findsOneWidget);
  });

  testWidgets('Navigation from SecondScreen to ThirdScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Navigate to SecondScreen
    await tester.tap(find.text('Перейти на Второй экран'));
    await tester.pumpAndSettle();

    // Navigate to ThirdScreen
    await tester.tap(find.text('Перейти на Третий экран'));
    await tester.pumpAndSettle();

    // Verify that ThirdScreen is displayed
    expect(find.text('Третий экран'), findsOneWidget);
    expect(find.text('Вы на Третьем экране!'), findsOneWidget);
    expect(find.text('Назад на Главный экран'), findsOneWidget);
    expect(find.text('Назад'), findsOneWidget);
  });

  testWidgets('Back navigation works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Navigate to SecondScreen
    await tester.tap(find.text('Перейти на Второй экран'));
    await tester.pumpAndSettle();

    // Go back to HomeScreen
    await tester.tap(find.text('Назад'));
    await tester.pumpAndSettle();

    // Verify that we're back on HomeScreen
    expect(find.text('Главный экран'), findsOneWidget);
  });
}