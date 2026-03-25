import 'package:dartz/dartz.dart';
import 'package:notiva/features/auth/domain/entities/auth_failure.dart';
import 'package:notiva/features/auth/domain/entities/auth_user.dart';

abstract class AuthRepository {
  Stream<AuthUser> get user;

  Future<Either<AuthFailure, AuthUser>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, AuthUser>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });
  Future<void> signOut();

  Future<Either<AuthFailure, Unit>> forgotPassword({required String email});

  AuthUser get currentUser;
}
