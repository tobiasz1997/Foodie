import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('pl')
  ];

  static String getCountry(String code, BuildContext context) {
    switch (code) {
      case 'en':
        return AppLocalizations.of(context)!.english;
      case 'pl':
        return AppLocalizations.of(context)!.polish;
      default:
        return '';
    }
  }
}