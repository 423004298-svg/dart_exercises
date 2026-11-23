import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:classquest_week14/main.dart';
import 'package:classquest_week14/screens/dashboard_screen.dart';
import 'package:classquest_week14/theme.dart';

void main() {
  testWidgets('Screen 1 (Welcome) shows the app name and Log in button',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ClassQuestApp());

    expect(find.text('ClassQuest'), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);
  });

  testWidgets('Screen 2 (Dashboard) shows the Coming up section',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(theme: buildAppTheme(), home: const DashboardScreen()),
    );

    expect(find.text('Coming up'), findsOneWidget);
    expect(find.text('Physics Lab Report'), findsOneWidget);
  });
}
