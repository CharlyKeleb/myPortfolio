import 'package:flutter/material.dart';

class ThemeConfig {
  //Colors for theme
  static Color lightPrimary = Colors.white;
  static Color lightAccent = Colors.purple;
  static Color lightBG = Colors.white;

  static ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
      selectionColor: lightAccent,
      selectionHandleColor: lightAccent,
    ),
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: lightBG,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: lightAccent)
        .copyWith(background: lightBG),
  );
}
