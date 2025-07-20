import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme({required bool isDarkMode}) {
    final base = isDarkMode ? ThemeData.dark() : ThemeData.light();

    final primaryColor = Colors.deepOrange;
    final accentColor = Colors.orangeAccent;

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: primaryColor,
        secondary: accentColor,
        surface: isDarkMode ? Colors.black : Colors.white,
        onPrimary: Colors.white,
      ),
      scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        titleTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: base.colorScheme.surface,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.grey[800],
        contentTextStyle: const TextStyle(color: Colors.white),
      ),
      textTheme: base.textTheme.copyWith(
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 14, color: base.colorScheme.onSurface),
        titleMedium: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
