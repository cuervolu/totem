import 'package:logger/logger.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';
import 'package:totem/core/di/injection.dart';

class ConnectivityManager {
  ToastificationItem? _disconnectionToast;
  bool _lastConnectionState = true;
  final _logger = getIt<Logger>();

  void handleConnectivityChange(bool isConnected, BuildContext? context) {
    _logger.d('Connectivity changed: $isConnected');
    if (!isConnected && _lastConnectionState) {
      _disconnectionToast = toastification.show(
        context: context,
        type: ToastificationType.warning,
        style: ToastificationStyle.minimal,
        title: const Text('Sin conexión a internet'),
        autoCloseDuration: null,
        showProgressBar: false,
      );
    } else if (isConnected &&
        !_lastConnectionState &&
        _disconnectionToast != null) {
      toastification.dismiss(_disconnectionToast!);
      _disconnectionToast = null;
    }
    _lastConnectionState = isConnected;
  }

  void dispose() {
    _logger.d('ConnectivityManager disposed');
    if (_disconnectionToast != null) {
      toastification.dismiss(_disconnectionToast!);
    }
  }
}
