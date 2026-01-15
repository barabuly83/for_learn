import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice01/app.dart';

void main() {
  testWidgets('App loads and shows users page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that app title is shown
    expect(find.text('Users List'), findsOneWidget);
    
    // Verify that loading indicator is shown initially
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    
    // Wait for data to load
    await tester.pumpAndSettle();
    
    // Verify that the app structure is correct
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}