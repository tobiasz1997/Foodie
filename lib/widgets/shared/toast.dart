import 'package:flutter/material.dart';

enum ToastType { success, info, error, warning }

void showToast(
  BuildContext context,
  String message, {
  ToastType type = ToastType.success,
}) {
  String getIcon() {
    switch (type) {
      case ToastType.success:
        return '✅';
      case ToastType.info:
        return 'ℹ️';
      case ToastType.error:
        return '❌';
      case ToastType.warning:
        return '⚠️';
    }
  }

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${getIcon()} $message'),
      showCloseIcon: true,
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
