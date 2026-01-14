import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class ConnectivityCubit extends Cubit<bool> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivityCubit() : super(true) {
    _init();
  }

  Future<void> _init() async {
    final result = await _connectivity.checkConnectivity();
    emit(_hasConnection(result));

    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      emit(_hasConnection(result));
    });
  }

  bool _hasConnection(List<ConnectivityResult> result) {
    return result.any((r) => r != ConnectivityResult.none);
  }

  Future<bool> checkConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    return _hasConnection(result);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
