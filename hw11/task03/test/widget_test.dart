// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:task03/app.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed
    expect(find.text('Навигация с Navigator 2.0'), findsOneWidget);
    
    // Verify that contacts screen is loaded
    expect(find.text('Список контактов'), findsOneWidget);
  });

  testWidgets('Contacts list displays contacts', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    // Wait for the app to load
    await tester.pumpAndSettle();
    
    // Verify that contacts are displayed
    expect(find.text('Александр Иванов'), findsOneWidget);
    expect(find.text('Мария Петрова'), findsOneWidget);
    expect(find.text('Senior Flutter Developer'), findsOneWidget);
    expect(find.text('UI/UX Designer'), findsOneWidget);
  });
}