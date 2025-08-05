import 'package:flutter/cupertino.dart';
import 'package:foodie/l10n/translations/exceptions.dart';

enum ExceptionCode {
  DE, // default error
  VE001 // validation error - shopping list item model
}

class CustomException implements Exception {
  final String message;
  final ExceptionCode errorCode;

  CustomException(this.message, {this.errorCode = ExceptionCode.DE});

  ExceptionCode getCode() => errorCode;

  String getMessage(BuildContext context) => errorCode == ExceptionCode.DE
      ? toString()
      : getExceptionMessage(errorCode, context);

  @override
  String toString() =>
      '${errorCode == ExceptionCode.DE ? 'Unknown error: ' : ''}$message';
}
