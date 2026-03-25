import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notiva/core/services/connectivity_service.dart';
import 'package:notiva/core/utils/logging/app_logger.dart';
import 'package:notiva/features/auth/data/mappers/auth_mapper.dart';
import 'package:notiva/features/auth/data/mappers/firebase_auth_error_mapper.dart';
import 'package:notiva/features/auth/domain/entities/auth_failure.dart';
import 'package:notiva/features/auth/domain/entities/auth_user.dart';
import 'package:notiva/features/auth/domain/repositories/auth_repository.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  FirebaseAuthRepositoryImpl({
    required FirebaseAuth firebaseAuth,
    required ConnectivityService connectivityService,
  }) : _firebaseAuth = firebaseAuth,
       _connectivityService = connectivityService;

  final FirebaseAuth _firebaseAuth;
  final ConnectivityService _connectivityService;

  Future<Either<AuthFailure, AuthUser>> _safeAuthCall(
    Future<UserCredential> Function() action,
  ) async {
    if (!_connectivityService.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final userCredential = await action();
      return Right(AuthMapper.toDomain(userCredential.user));
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthErrorMapper.mapException(e));
    } on Exception catch (e, stack) {
      AppLogger.error('Auth Unexpected Error', e, stack);
      return const Left(UnknownAuthFailure());
    }
  }

  @override
  Stream<AuthUser> get user =>
      _firebaseAuth.authStateChanges().map(AuthMapper.toDomain);

  @override
  AuthUser get currentUser => AuthMapper.toDomain(_firebaseAuth.currentUser);

  @override
  Future<Either<AuthFailure, AuthUser>> signInWithEmail({
    required String email,
    required String password,
  }) {
    return _safeAuthCall(
      () => _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<AuthFailure, AuthUser>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) {
    return _safeAuthCall(() async {
      final cred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await cred.user?.updateDisplayName(name);
      return cred;
    });
  }

  @override
  Future<void> signOut() async {
    await Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }

  @override
  Future<Either<AuthFailure, Unit>> forgotPassword({
    required String email,
  }) async {
    if (!_connectivityService.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthErrorMapper.mapException(e));
    } on Exception catch (e, stack) {
      AppLogger.error('Auth Forgot Password Error', e, stack);
      return const Left(UnknownAuthFailure());
    }
  }
}
