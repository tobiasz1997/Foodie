import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/common/utils/exception.dart';

String getExceptionMessage(ExceptionCode code, BuildContext context) {
  switch (code) {
    case ExceptionCode.VE001:
      return AppLocalizations.of(context)!.exceptionCodeVE001ErrorMessage;
    default:
      return ''; // fallback
  }
}
