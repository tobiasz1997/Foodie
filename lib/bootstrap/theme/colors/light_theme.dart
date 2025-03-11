import 'dart:ui';

import 'package:flutter/material.dart';

class LightTheme {
  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: Color.fromRGBO(232, 90, 79, 1.0),
    onPrimaryContainer: Color.fromRGBO(233, 128, 116, 1.0),
    secondary: Color.fromRGBO(216, 195, 165, 1.0),
    onSecondaryContainer: Color.fromRGBO(226, 231, 220, 1.0),
    background: Color(0xFAFAFAFF),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: Color.fromRGBO(255, 0, 0, 1.0),
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: Color.fromRGBO(216, 195, 165, 1.0),
    iconTheme: IconThemeData(color: Color.fromRGBO(232, 90, 79, 1.0)),
    actionsIconTheme: IconThemeData(color: Color(0xFF616161)),
    titleTextStyle: TextStyle(
      fontFamily: 'RobotoMono',
      color: Color.fromRGBO(232, 90, 79, 1.0),
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
    toolbarTextStyle: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w500
    ),
  );

  static const IconThemeData _iconTheme = IconThemeData(color: Color(0xFF616161));

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w700,
      fontSize: 36,
      color: Color.fromRGBO(232, 90, 79, 1.0),
    ),
    displayMedium: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w700,
      fontSize: 22,
      color: Color.fromRGBO(232, 90, 79, 1.0),
    ),
    titleLarge: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(232, 90, 79, 1.0),
    ),
    bodyLarge: TextStyle(
        fontFamily: 'RobotoMono',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF616161)),
    bodyMedium: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color.fromRGBO(232, 90, 79, 1.0),
    ),
    labelLarge: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color.fromRGBO(226, 231, 220, 1.0),
    ),
  );

  static const FloatingActionButtonThemeData _floatingActionButtonThemeData =
  FloatingActionButtonThemeData(
    splashColor: Color.fromRGBO(233, 128, 116, 0.5),
    backgroundColor: Color.fromRGBO(232, 90, 79, 1.0),
    foregroundColor: Color.fromRGBO(226, 231, 220, 1.0),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    iconTheme: _iconTheme,
    appBarTheme: _appBarTheme,
    colorScheme: _lightColorScheme,
    textTheme: _textTheme,
    floatingActionButtonTheme: _floatingActionButtonThemeData,
    scaffoldBackgroundColor: const Color.fromRGBO(226, 231, 220, 1.0),
  );
}