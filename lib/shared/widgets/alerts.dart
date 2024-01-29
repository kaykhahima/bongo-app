import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

enum AlertType {
  success,
  error,
  warning,
  info,
}

class Alerts {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    required AlertType type,
  }) {
    toastification.show(
      context: context,
      type: _getToastNotificationType(type),
      style: ToastificationStyle.fillColored,
      title: Text(title),
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      showProgressBar: true,
      dragToClose: true,
      icon: _getToastNotificationIcon(type),
    );
  }
}

_getToastNotificationType(AlertType type) {
  switch (type) {
    case AlertType.success:
      return ToastificationType.success;
    case AlertType.error:
      return ToastificationType.error;
    case AlertType.warning:
      return ToastificationType.warning;
    case AlertType.info:
      return ToastificationType.info;
    default:
      return ToastificationType.success;
  }
}

_getToastNotificationIcon(AlertType type) {
  switch (type) {
    case AlertType.success:
      return const Icon(Icons.check_circle_outline);
    case AlertType.error:
      return const Icon(Icons.close);
    case AlertType.warning:
      return const Icon(Icons.warning_amber_outlined);
    case AlertType.info:
      return const Icon(Icons.info_outline);
    default:
      return const Icon(Icons.check);
  }
}
