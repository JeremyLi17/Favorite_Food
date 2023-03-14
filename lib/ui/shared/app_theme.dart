import 'package:flutter/material.dart';

class AppTheme {
  // common
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 25;

  // normal Theme
  static const Color normalTextColors = Colors.black;
  static final ThemeData normalTheme = ThemeData(
    primarySwatch: Colors.green,
    canvasColor: const Color.fromRGBO(255, 254, 240, 1),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: bodyFontSize,
        color: normalTextColors,
      ),
      displaySmall: TextStyle(
        fontSize: smallFontSize,
        color: normalTextColors,
      ),
      displayMedium: TextStyle(
        fontSize: normalFontSize,
        color: normalTextColors,
      ),
      displayLarge: TextStyle(
        fontSize: largeFontSize,
        color: normalTextColors,
      )
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
    ).copyWith(secondary: Colors.amber)
  );

  // dark Theme
  static const Color darkTextColors = Colors.white;
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: bodyFontSize,
          color: darkTextColors,
        ),
        displaySmall: TextStyle(
          fontSize: smallFontSize,
          color: darkTextColors,
        ),
        displayMedium: TextStyle(
          fontSize: normalFontSize,
          color: darkTextColors,
        ),
        displayLarge: TextStyle(
          fontSize: largeFontSize,
          color: darkTextColors,
        )
    ),
  );
}