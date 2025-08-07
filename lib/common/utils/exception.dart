import 'package:flutter/cupertino.dart';
import 'package:foodie/l10n/translations/exceptions.dart';

enum ExceptionCode {
  de, // default error
  ve001 // validation error - shopping list item model
}

class CustomException implements Exception {
  final String message;
  final ExceptionCode errorCode;

  CustomException(this.message, {this.errorCode = ExceptionCode.de});

  ExceptionCode getCode() => errorCode;

  String getMessage(BuildContext context) => errorCode == ExceptionCode.de
      ? toString()
      : getExceptionMessage(errorCode, context);

  @override
  String toString() =>
      '${errorCode == ExceptionCode.de ? 'Unknown error: ' : ''}$message';
}
