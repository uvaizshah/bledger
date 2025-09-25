import 'package:flutter/material.dart';

class AppTheme {
  // Primary colors - Ocean Blue
  static const Color primaryColor = Color(0xFF1E3A8A);
  static const Color primaryLightColor = Color(0xFF3B82F6);
  static const Color primaryDarkColor = Color(0xFF1E40AF);
  
  // Secondary colors - Teal
  static const Color secondaryColor = Color(0xFF14B8A6);
  static const Color secondaryLightColor = Color(0xFF5EEAD4);
  static const Color secondaryDarkColor = Color(0xFF0F766E);
  
  // Accent colors
  static const Color accentColor = Color(0xFF8B5CF6);
  static const Color accentLightColor = Color(0xFFA78BFA);
  
  // Background colors
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color backgroundDark = Color(0xFF0F172A);
  
  // Glassmorphism colors
  static const Color glassWhite = Color(0x40FFFFFF);
  static const Color glassBlack = Color(0x40000000);
  static const Color glassPrimary = Color(0x401E3A8A);
  static const Color glassSecondary = Color(0x4014B8A6);
  
  // Text colors
  static const Color textOnPrimary = Colors.white;
  static const Color textOnSecondary = Colors.black;
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  
  // Card colors
  static const Color cardLight = Color(0x80FFFFFF);
  static const Color cardDark = Color(0x801E293B);
  
  // Success, warning, error colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  
  // Gradient colors
  static const List<Color> primaryGradient = [
    Color(0xFF1E3A8A),
    Color(0xFF3B82F6),
    Color(0xFF60A5FA),
  ];
  
  static const List<Color> secondaryGradient = [
    Color(0xFF14B8A6),
    Color(0xFF5EEAD4),
    Color(0xFF99F6E4),
  ];
  
  static const List<Color> glassGradient = [
    Color(0x40FFFFFF),
    Color(0x20FFFFFF),
  ];
  
  // Glassmorphism box decoration
  static BoxDecoration get glassDecoration => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: glassGradient,
    ),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: Colors.white.withOpacity(0.2),
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
    ],
  );
  
  // Glassmorphism card decoration
  static BoxDecoration get glassCardDecoration => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white.withOpacity(0.25),
        Colors.white.withOpacity(0.1),
      ],
    ),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: Colors.white.withOpacity(0.3),
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 15,
        offset: const Offset(0, 8),
      ),
    ],
  );

  // Get light theme
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        onPrimary: textOnPrimary,
        primaryContainer: primaryLightColor,
        onPrimaryContainer: textOnPrimary,
        secondary: secondaryColor,
        onSecondary: textOnSecondary,
        secondaryContainer: secondaryLightColor,
        onSecondaryContainer: textOnSecondary,
        background: backgroundLight,
        surface: cardLight,
        error: error,
      ),
      scaffoldBackgroundColor: backgroundLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: textOnPrimary,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: cardLight,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryColor,
          foregroundColor: textOnSecondary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
      ),
    );
  }

  // Get dark theme
  static ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        onPrimary: textOnPrimary,
        primaryContainer: primaryDarkColor,
        onPrimaryContainer: textOnPrimary,
        secondary: secondaryColor,
        onSecondary: textOnSecondary,
        secondaryContainer: secondaryDarkColor,
        onSecondaryContainer: textOnPrimary,
        background: backgroundDark,
        surface: cardDark,
        error: error,
      ),
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryDarkColor,
        foregroundColor: textOnPrimary,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: cardDark,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryColor,
          foregroundColor: textOnSecondary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: secondaryLightColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: secondaryColor, width: 2),
        ),
      ),
    );
  }
}