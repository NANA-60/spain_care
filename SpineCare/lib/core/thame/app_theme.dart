import 'package:flutter/material.dart';
import 'package:spinecare/core/colors/app_colors.dart';

class AppTheme {
  // ===== LIGHT =====
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF4BA8A6),
      secondary: Color(0xFF8CCCCC),
      background: Colors.white,
      surface: Color(0xFFF5F7F7),
      onPrimary: Colors.white,
      onSecondary: Colors.black87,
      onSurface: Colors.white,
    ),

    cardColor: const Color(0xFF8CCCCC),

    textTheme: const TextTheme(
      // العناوين الكبيرة (Settings / Result)
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),

      // عناوين الأقسام
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),

      // النص العادي
      bodyMedium: TextStyle(
        fontSize: 13,
        color: Colors.black54,
      ),



      // نصوص ثانوية
      bodySmall: TextStyle(
        fontSize: 11,
        color: Colors.black45,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF4BA8A6),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,

      ),
    ),
  );

  // ===== DARK =====
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF4BA8A6),
      secondary: Color(0xFF1E2E2E),
      background: Color(0xFF121212),
      surface: Color(0xFF1C1C1C),
      onPrimary: Colors.white,
      onSecondary: Colors.white70,
      onSurface: Color(0xFF4BA8A6),
    ),

    cardColor: const Color(0xFF1E2E2E),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4BA8A6), // 👈 مثل لون التطبيق
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        color: Colors.white70,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        color: Colors.white60,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E2E2E),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
