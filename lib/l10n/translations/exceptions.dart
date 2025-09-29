import 'package:flutter/widgets.dart';
import 'package:foodie/common/utils/exception.dart';
import 'package:foodie/l10n/app_localizations.dart';

String getExceptionMessage(ExceptionCode code, BuildContext context) {
  switch (code) {
    case ExceptionCode.ve001:
      return AppLocalizations.of(context)!.exceptionCodeVE001ErrorMessage;
    default:
      return ''; // fallback
  }
}
