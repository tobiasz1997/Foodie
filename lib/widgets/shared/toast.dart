import 'package:flutter/material.dart';

enum ToastType { Success, Info, Error, Warning }

void showToast(BuildContext context, String message,
    {ToastType type = ToastType.Success}) {
  String getIcon() {
    switch (type) {
      case ToastType.Success:
        return '✅';
      case ToastType.Info:
        return 'ℹ️';
      case ToastType.Error:
        return '❌';
      case ToastType.Warning:
        return '⚠️';
    }
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${getIcon()} $message'),
      showCloseIcon: true,
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
