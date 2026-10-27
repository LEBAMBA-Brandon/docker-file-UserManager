import 'package:flutter/material.dart';

class LightTheme {
  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: _colorSchemeLight,
      textTheme: _textThemeLight,
      elevatedButtonTheme: _elevatedButtonThemeLight,
      cardTheme: _cardThemeLight,
      inputDecorationTheme: _inputDecorationThemeLight,
    );
  }

  final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: const Color.fromARGB(255, 26, 194, 255),
    onPrimary: Colors.grey.shade100,
    secondary: const Color.fromARGB(255, 94, 212, 255),
    surface: const Color.fromARGB(255, 255, 255, 255),
    error: const Color.fromARGB(255, 231, 113, 93),
  );

  final TextTheme _textThemeLight = TextTheme(
    // texte pour le titre de l’appli
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    // texte pour les titres de contenu
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    // texte pour le prix
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.1,
      color: const Color.fromARGB(255, 26, 194, 255),
      overflow: TextOverflow.ellipsis,
    ),

    //texte pour le contenu
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.25,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    //texte pour la description
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: Colors.grey,
      overflow: TextOverflow.ellipsis,
    ),

    //texte pour les boutons
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: Colors.white,
      overflow: TextOverflow.ellipsis,
    ),

    //texte pour les description titre connexion
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Colors.grey.shade700,
      overflow: TextOverflow.ellipsis,
    ),
  );

  final ElevatedButtonThemeData _elevatedButtonThemeLight =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(double.maxFinite, 30),
          backgroundColor: const Color.fromARGB(255, 26, 194, 255),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  final CardThemeData _cardThemeLight = CardThemeData(
    elevation: 1,
    margin: EdgeInsets.all(8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    clipBehavior: Clip.antiAlias,
  );

  final InputDecorationTheme _inputDecorationThemeLight = InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 107, 130, 244),
        width: 2,
      ),
    ),

    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  );
}
