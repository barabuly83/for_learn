import 'package:flutter_test/flutter_test.dart';

import 'package:task01/app.dart';

void main() {
  testWidgets('Transition animation screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Анимация перехода'), findsOneWidget);
    expect(find.text('Контейнер 1'), findsOneWidget);
  });

  testWidgets('Tapping switches containers', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Контейнер 1'), findsOneWidget);
    expect(find.text('Контейнер 2'), findsNothing);

    await tester.tap(find.text('Контейнер 1'));
    await tester.pumpAndSettle();

    expect(find.text('Контейнер 1'), findsNothing);
    expect(find.text('Контейнер 2'), findsOneWidget);
  });
}
