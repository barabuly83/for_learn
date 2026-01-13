import 'package:flutter_test/flutter_test.dart';

import 'package:practice02/app.dart';

void main() {
  testWidgets('HomeScreen displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that HomeScreen is displayed
    expect(find.text('Главный экран'), findsOneWidget);
    expect(find.text('Текущая тема: Светлая'), findsOneWidget);
    expect(find.text('Переключить тему'), findsOneWidget);
    expect(find.text('Кнопка с локальной темой'), findsOneWidget);
  });

  testWidgets('Theme toggle button works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify initial theme is light
    expect(find.text('Текущая тема: Светлая'), findsOneWidget);

    // Tap the theme toggle button
    await tester.tap(find.text('Переключить тему'));
    await tester.pumpAndSettle();

    // Verify theme changed to dark
    expect(find.text('Текущая тема: Тёмная'), findsOneWidget);
  });

  testWidgets('Navigation to SettingsScreen works',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the settings icon
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();

    // Verify that SettingsScreen is displayed
    expect(find.text('Настройки темы'), findsOneWidget);
    expect(find.text('Тема приложения'), findsOneWidget);
    expect(find.byType(SwitchListTile), findsOneWidget);
  });

  testWidgets('Local theme changes work', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify local themed button exists
    expect(find.text('Кнопка с локальной темой'), findsOneWidget);
    expect(find.text('Этот текст имеет локальные стили'), findsOneWidget);
  });
}