import 'package:firebase_auth/firebase_auth.dart';
import 'package:notiva/core/utils/app_logger.dart';
import 'package:notiva/features/auth/domain/entities/auth_failure.dart';

class FirebaseAuthErrorMapper {
  FirebaseAuthErrorMapper._();

  static AuthFailure mapException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return const InvalidCredentialsFailure();
      case 'user-disabled':
        return const UserDisabledFailure();
      case 'email-already-in-use':
        return const EmailAlreadyInUseFailure();
      case 'weak-password':
        return const WeakPasswordFailure();
      case 'operation-not-allowed':
        return const OperationNotAllowedFailure();
      case 'too-many-requests':
        return const TooManyRequestsFailure();
      case 'network-request-failed':
        return const NetworkFailure();
      default:
        AppLogger.error('Firebase Auth Exception (Unhandled): ${e.code}');
        return const UnknownAuthFailure();
    }
  }
}
