import 'package:flutter/material.dart';

class DarkTheme {
  static const ColorScheme _darkColorScheme = ColorScheme(
    primary: Color.fromRGBO(102, 252, 241, 1.0),
    onPrimaryContainer: Color.fromRGBO(69, 162, 158, 1.0),
    secondary: Color.fromRGBO(11, 12, 16, 1.0),
    onSecondaryContainer: Color.fromRGBO(31, 40, 51, 1.0),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    error: Color.fromRGBO(255, 0, 0, 1.0),
    onError: Colors.black,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    brightness: Brightness.dark,
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: Color.fromRGBO(11, 12, 16, 1.0),
    iconTheme: IconThemeData(color: Color.fromRGBO(102, 252, 241, 1.0)),
    actionsIconTheme: IconThemeData(color: Color.fromRGBO(197, 198, 199, 1.0)),
    titleTextStyle: TextStyle(
      fontFamily: 'RobotoMono',
      color: Color.fromRGBO(102, 252, 241, 1.0),
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
    toolbarTextStyle:
        TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.w500),
  );

  static const IconThemeData _iconTheme =
      IconThemeData(color: Color.fromRGBO(197, 198, 199, 1.0));

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w700,
      fontSize: 36,
      color: Color.fromRGBO(102, 252, 241, 1.0),
    ),
    displayMedium: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w700,
      fontSize: 22,
      color: Color.fromRGBO(102, 252, 241, 1.0),
    ),
    titleLarge: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(102, 252, 241, 1.0),
    ),
    bodyLarge: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color.fromRGBO(102, 252, 241, 1.0),
    ),
    bodyMedium: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color.fromRGBO(197, 198, 199, 1.0),
      decorationColor: Color.fromRGBO(102, 252, 241, 1.0),
      decorationThickness: 2.5,
    ),
    bodySmall: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color.fromRGBO(102, 252, 241, 1.0),
    ),
    labelLarge: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color.fromRGBO(31, 40, 51, 1.0),
    ),
    headlineSmall: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: Color.fromRGBO(102, 252, 241, 1.0),
    ),
  );

  static const FloatingActionButtonThemeData _floatingActionButtonThemeData =
      FloatingActionButtonThemeData(
    splashColor: Color.fromRGBO(69, 162, 158, 1.0),
    backgroundColor: Color.fromRGBO(102, 252, 241, 1.0),
    foregroundColor: Color.fromRGBO(31, 40, 51, 1.0),
  );

  static const DialogTheme _dialogThemeData =
      DialogTheme(backgroundColor: Color.fromRGBO(31, 40, 51, 1.0));

  static const ListTileThemeData _listTileThemeData = ListTileThemeData(
    iconColor: Color.fromRGBO(102, 252, 241, 1.0),
    titleTextStyle: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color.fromRGBO(102, 252, 241, 1.0),
    ),
    subtitleTextStyle: TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color.fromRGBO(69, 162, 158, 1.0),
    ),
  );

  static const DividerThemeData _dividerThemeData =
      DividerThemeData(color: Color.fromRGBO(11, 12, 16, 1.0));

  static const CheckboxThemeData _checkboxThemeData = CheckboxThemeData(
    side: BorderSide(color: Color.fromRGBO(69, 162, 158, 1.0)),
  );

  static const SnackBarThemeData _snackBarThemeData = SnackBarThemeData(
    backgroundColor: Color.fromRGBO(102, 252, 241, 1.0),
    closeIconColor: Color.fromRGBO(31, 40, 51, 1.0),
    contentTextStyle: TextStyle(color: Color.fromRGBO(31, 40, 51, 1.0)),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: _iconTheme,
    appBarTheme: _appBarTheme,
    colorScheme: _darkColorScheme,
    textTheme: _textTheme,
    dialogTheme: _dialogThemeData,
    listTileTheme: _listTileThemeData,
    dividerTheme: _dividerThemeData,
    checkboxTheme: _checkboxThemeData,
    snackBarTheme: _snackBarThemeData,
    floatingActionButtonTheme: _floatingActionButtonThemeData,
    dialogBackgroundColor: const Color.fromRGBO(31, 40, 51, 1.0),
    scaffoldBackgroundColor: const Color.fromRGBO(31, 40, 51, 1.0),
  );
}
