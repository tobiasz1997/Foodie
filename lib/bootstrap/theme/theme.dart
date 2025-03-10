import 'package:flutter/material.dart';
import 'package:foodie/common/static/keys.dart';
import 'package:foodie/common/storage/local_storage.dart';

import 'colors/dark_theme.dart';
import 'colors/light_theme.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  ThemeData getTheme() {
    var localThemeValue = LocalStorage.getLocalStorageValue(THEME_DATA_KEY);

    switch (localThemeValue) {
      case 'dark':
        _themeData = DarkTheme.darkTheme;
        break;
      case 'light':
        _themeData = LightTheme.lightTheme;
        break;
      default:
        _themeData = LightTheme.lightTheme;
        break;
    }

    return _themeData;
  }

  bool isDarkTheme() {
    return (_themeData.brightness == Brightness.dark);
  }

  void setTheme(bool isDarkTheme) {
    (isDarkTheme) ? _themeData = DarkTheme.darkTheme : _themeData = LightTheme.lightTheme;

    (_themeData.brightness == Brightness.light)
        ? LocalStorage.putLocalStorageValue(THEME_DATA_KEY, 'light')
        : LocalStorage.putLocalStorageValue(THEME_DATA_KEY, 'dark');

    notifyListeners();
  }
}
