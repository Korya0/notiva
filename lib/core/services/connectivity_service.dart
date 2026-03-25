import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  ConnectivityService() {
    _subscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );

    unawaited(_checkInitialConnection());
  }

  final Connectivity _connectivity = Connectivity();
  final _connectionController = StreamController<bool>.broadcast();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  bool _isConnectedNow = true;

  Future<void> _checkInitialConnection() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } on Exception catch (_) {
      _connectionController.add(false);
    }
  }

  Stream<bool> get onConnectivityChanged => _connectionController.stream;

  bool get isConnected => _isConnectedNow;

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    _isConnectedNow = results.any(
      (element) => element != ConnectivityResult.none,
    );

    if (!_connectionController.isClosed) {
      _connectionController.add(_isConnectedNow);
    }
  }

  void dispose() {
    unawaited(_subscription?.cancel());
    unawaited(_connectionController.close());
  }
}
