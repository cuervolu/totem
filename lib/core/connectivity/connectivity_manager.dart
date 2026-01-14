import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';

class ConnectivityManager {
  ToastificationItem? _disconnectionToast;
  bool _lastConnectionState = true;

  void handleConnectivityChange(bool isConnected, BuildContext? context) {
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
    if (_disconnectionToast != null) {
      toastification.dismiss(_disconnectionToast!);
    }
  }
}
