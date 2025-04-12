import 'package:flutter/material.dart';

class AppThemes {
  // Define the new color palette
  static const Color lightBackground =
      Color(0xFFE6E5E7); // Lightest grayish white
  static const Color lightSurface = Color(0xFFE9E3F1); // Soft pastel purple
  static const Color mediumPurple = Color(0xFFB6B6D5); // Muted lavender
  static const Color darkGray = Color(0xFF757179); // Deep gray
  static const Color darkestBlue = Color(0xFF0E0F23); // Near-black blue

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: mediumPurple,
    scaffoldBackgroundColor: lightBackground,
    // Add colorScheme to define surface (Container) color
    colorScheme: const ColorScheme.light(
      primary: mediumPurple,
      surface: lightSurface, // Default Container color
      onSurface: Colors.black87,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: mediumPurple,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        color: Colors.black87,
        fontFamily: 'Poppins',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: mediumPurple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: mediumPurple, width: 2),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkestBlue,
    // Add colorScheme to define surface (Container) color
    colorScheme: const ColorScheme.dark(
      primary: mediumPurple,
      surface: darkGray,
      onSurface: Colors.white70,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkGray,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        color: Colors.white70,
        fontFamily: 'Poppins',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: mediumPurple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkGray,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: mediumPurple, width: 2),
      ),
    ),
  );
}
