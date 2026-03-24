import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  final Connectivity _connectivity = Connectivity();
  final _connectionController = StreamController<bool>.broadcast();

  Stream<bool> get onConnectivityChanged => _connectionController.stream;

  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result.any((element) => element != ConnectivityResult.none);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    _connectionController.add(
      results.any((element) => element != ConnectivityResult.none),
    );
  }

  void dispose() {
    unawaited(_connectionController.close());
  }
}
