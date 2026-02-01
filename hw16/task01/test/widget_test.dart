// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:task01/app.dart';

void main() {
  testWidgets('Notes app smoke test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is present
    expect(find.text('Заметки'), findsOneWidget);

    // Verify that the text field for note title is present
    expect(find.byType(TextField), findsOneWidget);

    // Verify that the "Добавить заметку" button is present
    expect(find.text('Добавить заметку'), findsOneWidget);

    // Verify that "Нет заметок" text is shown initially
    expect(find.text('Нет заметок'), findsOneWidget);

    // Enter text in the title field
    await tester.enterText(find.byType(TextField), 'Test Note');
    await tester.pump();

    // Tap the add button
    await tester.tap(find.text('Добавить заметку'));
    await tester.pump();

    // Verify that the note was added
    expect(find.text('Test Note'), findsOneWidget);
    expect(find.text('Нет заметок'), findsNothing);

    // Tap the delete button
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // Verify that the note was removed
    expect(find.text('Test Note'), findsNothing);
    expect(find.text('Нет заметок'), findsOneWidget);
  });
}
