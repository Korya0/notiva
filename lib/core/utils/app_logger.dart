import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class AppLogger {
  static void debug(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _log('DEBUG', message, error, stackTrace);
    }
  }

  static void info(String message) {
    _log('INFO', message);
  }

  static void warning(String message, [Object? error, StackTrace? stackTrace]) {
    _log('WARNING', message, error, stackTrace);
  }

  // TODO(Future-Optimization): Enhance error tracking for enterprise scalability.
  // 1. Use Crashlytics.instance.setUserIdentifier(userId) after successful login.
  // 2. Implement Crashlytics.instance.setCustomKey('user_role', role) to segment errors.
  // 3. Add 'connection_type' as a custom key to correlate crashes with network stability.
  // 4. Link AppLogger.info breadcrumbs to Crashlytics using log() for precise reproduction steps.
  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    _log('ERROR', message, error, stackTrace);
    if (!kDebugMode) {
      unawaited(
        FirebaseCrashlytics.instance.recordError(
          error ?? message,
          stackTrace,
          reason: message,
        ),
      );
    }
  }

  static void _log(
    String level,
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    final timestamp = DateTime.now().toIso8601String();
    debugPrint('[$timestamp] [$level] $message');
    if (error != null) debugPrint('Error: $error');
    if (stackTrace != null) debugPrint('StackTrace: $stackTrace');
  }
}
