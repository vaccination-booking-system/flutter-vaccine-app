import 'package:evizy/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home Screen Text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );
    expect(find.text('Alterra Academy'), findsOneWidget);
  });

  testWidgets('Home Screen Icon Button', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );
    await tester.tap(
      find.byIcon(Icons.notifications_rounded),
    );
    await tester.pump();
  });
}
