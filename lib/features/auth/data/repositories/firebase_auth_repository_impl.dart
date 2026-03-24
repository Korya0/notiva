import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notiva/core/utils/app_logger.dart';
import 'package:notiva/core/utils/connectivity_service.dart';
import 'package:notiva/features/auth/data/mappers/auth_mapper.dart';
import 'package:notiva/features/auth/data/mappers/firebase_auth_error_mapper.dart';
import 'package:notiva/features/auth/domain/entities/auth_failure.dart';
import 'package:notiva/features/auth/domain/entities/auth_user.dart';
import 'package:notiva/features/auth/domain/repositories/auth_repository.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  FirebaseAuthRepositoryImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required ConnectivityService connectivityService,
  }) : _firebaseAuth = firebaseAuth,
       _googleSignIn = googleSignIn,
       _connectivityService = connectivityService;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
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
    required String email,
    required String password,
  }) {
    return _safeAuthCall(
      () => _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<AuthFailure, AuthUser>> signInWithGoogle() {
    return _safeAuthCall(() async {
      final googleSignIn = _googleSignIn;

      // Setup a listener for the next sign-in event before triggering UI
      final eventFuture = googleSignIn.authenticationEvents.firstWhere(
        (e) => e is GoogleSignInAuthenticationEventSignIn,
      );

      if (googleSignIn.supportsAuthenticate()) {
        await googleSignIn.authenticate();
      } else if (kIsWeb) {
        throw Exception(
          'On web, Google Sign-In must be initiated via the GoogleSignIn button.',
        );
      } else {
        throw Exception('Google Sign-In is not supported on this platform.');
      }

      final event = await eventFuture;
      final authEvent = event as GoogleSignInAuthenticationEventSignIn;
      final googleUser = authEvent.user;

      // Get tokens using the new 7.x separated flow
      final googleAuth = googleUser.authentication;
      final idToken = googleAuth.idToken;

      // Access Token is now requested via authorizationClient
      final authorization = await googleUser.authorizationClient
          .authorizationForScopes([]);
      final accessToken = authorization?.accessToken;

      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      return _firebaseAuth.signInWithCredential(credential);
    });
  }

  @override
  Future<void> signOut() async {
    await Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }
}
