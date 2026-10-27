import 'package:flutter/material.dart';

class BlackTheme {
  ThemeData get blackTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: _colorSchemeDark,
      textTheme: _textThemeDark,
      elevatedButtonTheme: _elevatedButtonThemeDark,
      cardTheme: _cardThemeDark,
      inputDecorationTheme: _inputDecorationThemeDark,
    );
  }

  final ColorScheme _colorSchemeDark = ColorScheme.dark(
    primary: const Color.fromARGB(255, 26, 194, 255),
    onPrimary: Colors.grey.shade800,
    secondary: const Color.fromARGB(255, 94, 212, 255),
    surface: const Color.fromARGB(255, 50, 50, 50),
    error: const Color.fromARGB(255, 250, 43, 7),
  );

  final TextTheme _textThemeDark = TextTheme(
    // texte pour le titre de l’appli
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      overflow: TextOverflow.ellipsis,
      color: Colors.white,
    ),

    // texte pour les titres de contenu
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15,
      overflow: TextOverflow.ellipsis,
      color: Colors.white,
    ),

    // texte pour le prix
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.1,
      overflow: TextOverflow.ellipsis,
      color: const Color.fromARGB(255, 26, 194, 255),
    ),

    //texte pour le contenu
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.25,
      overflow: TextOverflow.ellipsis,
      color: Colors.white,
    ),

    //texte pour la description
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      overflow: TextOverflow.ellipsis,
      color: Colors.grey.shade300,
    ),

    //texte pour les boutons
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      overflow: TextOverflow.ellipsis,
      color: Colors.white,
    ),

    //texte pour les description titre connexion
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Colors.white54,
      overflow: TextOverflow.ellipsis,
    ),
  );

  final ElevatedButtonThemeData _elevatedButtonThemeDark =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  final CardThemeData _cardThemeDark = CardThemeData(
    elevation: 0,
    margin: EdgeInsets.all(8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    clipBehavior: Clip.antiAlias,
  );

  final InputDecorationTheme _inputDecorationThemeDark = InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color.fromARGB(255, 0, 7, 207), width: 2),
    ),

    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  );
}
