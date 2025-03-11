

import 'package:flutter/widgets.dart';
import 'package:foodie/common/static/keys.dart';
import 'package:foodie/common/storage/local_storage.dart';
import 'package:foodie/l10n/l10n.dart';

class LocaleProvider with ChangeNotifier {
  Locale locale = const Locale('en');

  get getLocale => locale;

  LocaleProvider() {
    _setLocale();
  }

  void setLocale(Locale selectedLocale) {
    if (!L10n.all.contains(selectedLocale)) return;

    locale = selectedLocale;
    LocalStorage.putLocalStorageValue(localeKey, selectedLocale.languageCode);
    notifyListeners();
  }

  void _setLocale() {
    var hoursFormat = LocalStorage.getLocalStorageValue(localeKey);

    switch (hoursFormat) {
      case 'en':
        setLocale(const Locale('en'));
        break;
      case 'pl':
        setLocale(const Locale('pl'));
        break;
      default:
        setLocale(const Locale('en'));
        break;
    }

    notifyListeners();
  }
}
