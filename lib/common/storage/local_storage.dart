
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _preference;

  static Future<void> initializeLocalStorage() async {
    _preference = await SharedPreferences.getInstance();
  }

  static Future<bool> putLocalStorageValue(String key, String value) {
    return _preference.setString(key, value);
  }

  static String getLocalStorageValue(String key, {String defaultValue = ''}) {
    return _preference.getString(key) ?? defaultValue;
  }

  static Future<void> clearLocalStorageValue() async {
    SharedPreferences preference = _preference;
    await preference.clear();
  }
}