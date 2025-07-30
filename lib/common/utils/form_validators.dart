import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? requiredValidator(BuildContext context, Object? value) {
  if (value == null || (value is String && value.isEmpty)) {
    return AppLocalizations.of(context)!.requiredField;
  }
  return null;
}
