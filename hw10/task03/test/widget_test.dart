import 'package:flutter_test/flutter_test.dart';

import 'package:task03/app.dart';

void main() {
  testWidgets('Fade Animation screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Fade Animation'), findsOneWidget);
    expect(find.text('Запуск анимации'), findsOneWidget);
    expect(find.text('Остановить анимацию'), findsOneWidget);
  });
}
