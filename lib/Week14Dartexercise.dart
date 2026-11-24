import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/welcome_screen.dart';
import 'theme.dart';

/// Pick which static screen to preview WITHOUT any navigation logic:
///   flutter run                          -> Screen 1 (Welcome)
///   flutter run --dart-define=SCREEN=2   -> Screen 2 (Dashboard)
const String _previewScreen = String.fromEnvironment('SCREEN', defaultValue: '1');

void main() {
  runApp(const ClassQuestApp());
}

class ClassQuestApp extends StatelessWidget {
  const ClassQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClassQuest',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: _previewScreen == '2' ? const DashboardScreen() : const WelcomeScreen(),
    );
  }
}
