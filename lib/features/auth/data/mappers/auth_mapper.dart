import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:notiva/features/auth/domain/entities/auth_user.dart';

class AuthMapper {
  AuthMapper._();

  static AuthUser toDomain(firebase_auth.User? firebaseUser) {
    if (firebaseUser == null) {
      return AuthUser.empty;
    }

    return AuthUser(
      id: firebaseUser.uid,
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoURL,
      isEmailVerified: firebaseUser.emailVerified,
    );
  }
}
