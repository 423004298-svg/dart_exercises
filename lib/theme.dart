import 'package:flutter/material.dart';

/// Shared design tokens so both screens look like one app.
class AppColors {
  static const bg = Color(0xFF14142B);
  static const surface = Color(0xFF1E1E42);
  static const surfaceRaised = Color(0xFF262654);
  static const border = Color(0xFF34335F);
  static const text = Color(0xFFF1F0FA);
  static const textMuted = Color(0xFF8E8AB3);
  static const amber = Color(0xFFFFB627);
  static const mint = Color(0xFF3DDC97);
  static const coral = Color(0xFFFF6B6B);
}

/// Consistent spacing scale used by both screens.
class Gap {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

ThemeData buildAppTheme() {
  final base = ThemeData(useMaterial3: true, brightness: Brightness.dark);

  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.amber,
      onPrimary: AppColors.bg,
      secondary: AppColors.mint,
      surface: AppColors.surface,
      error: AppColors.coral,
    ),
    // Typography: one place defines the text hierarchy for every screen.
    textTheme: base.textTheme.copyWith(
      headlineMedium: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        color: AppColors.text,
        height: 1.1,
      ),
      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.text,
      ),
      titleMedium: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.text,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        color: AppColors.text,
        height: 1.35,
      ),
      bodySmall: const TextStyle(
        fontSize: 12,
        color: AppColors.textMuted,
      ),
      labelLarge: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.amber,
        foregroundColor: AppColors.bg,
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surface,
      indicatorColor: AppColors.amber.withOpacity(0.2),
    ),
  );
}
