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
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed
    expect(find.text('Контакты и Навигация'), findsOneWidget);
    
    // Verify that welcome text is displayed
    expect(find.text('Добро пожаловать!'), findsOneWidget);
    
    // Verify that navigation buttons are present
    expect(find.text('О приложении'), findsOneWidget);
    expect(find.text('Контакты'), findsOneWidget);
  });

  testWidgets('Navigation to About page works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the 'About' button
    await tester.tap(find.text('О приложении'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the About page
    expect(find.text('О приложении'), findsOneWidget); // AppBar title
    expect(find.text('О приложении "Контакты и Навигация"'), findsOneWidget);
  });

  testWidgets('Navigation to Contacts page works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the 'Contacts' button
    await tester.tap(find.text('Контакты'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the Contacts page
    expect(find.text('Контакты'), findsOneWidget); // AppBar title
    expect(find.text('Иван Иванов'), findsOneWidget); // Contact in list
  });

  testWidgets('Back navigation works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Navigate to About page
    await tester.tap(find.text('О приложении'));
    await tester.pumpAndSettle();

    // Tap back button
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    // Verify that we're back on the home page
    expect(find.text('Добро пожаловать!'), findsOneWidget);
  });
}