import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/core/storage/app_storage.dart';
import 'package:notiva/core/storage/storage_keys.dart';
import 'package:notiva/core/utils/logging/app_logger.dart';
import 'package:notiva/features/auth/domain/entities/auth_failure.dart';
import 'package:notiva/features/auth/domain/entities/auth_user.dart';
import 'package:notiva/features/auth/domain/repositories/auth_repository.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository, this._storage) : super(const AuthInitial()) {
    unawaited(_init());
  }

  final AuthRepository _authRepository;
  final AppStorage _storage;
  StreamSubscription<AuthUser>? _userSubscription;
  Future<void>? _pendingUpdate;

  Future<void> _init() async {
    // Load persisted user if available for fast cold start
    final persistedId = _storage.read<String>(StorageKeys.userId);
    if (persistedId != null) {
      final user = AuthUser(
        id: persistedId,
        email: _storage.read<String>(StorageKeys.userEmail),
        displayName: _storage.read<String>(StorageKeys.userName),
      );
      emit(AuthAuthenticated(user));
      unawaited(_validateSession());
    }

    _userSubscription = _authRepository.user.listen(_onUserChanged);
  }

  Future<void> _validateSession() async {
    final result = await _authRepository.validateSession();
    result.fold(
      (failure) async {
        if (failure is UserDisabledFailure ||
            failure is InvalidCredentialsFailure) {
          AppLogger.info(
            'Security: Auth session expired detected on startup. User was logged out.',
          );
          emit(const AuthSessionExpired());
          await signOut();
        }
      },
      (_) => null,
    );
  }

  Future<void> _onUserChanged(AuthUser user) async {
    // Serialize updates to avoid race conditions in slow local storage
    final previousUpdate = _pendingUpdate;
    final completer = Completer<void>();
    _pendingUpdate = completer.future;

    await previousUpdate;

    try {
      if (user.isEmpty) {
        if (state is AuthAuthenticated) {
          // Only emit SessionExpired if we were previously logged in
          // and it wasn't a manual logout (repository will be empty)
          emit(const AuthSessionExpired());
        }
        await _clearPersistedUser();
        emit(const AuthUnauthenticated());
      } else {
        await _persistUser(user);
        emit(AuthAuthenticated(user));
      }
    } finally {
      completer.complete();
    }
  }

  Future<void> _persistUser(AuthUser user) async {
    await Future.wait<void>([
      _storage.write(StorageKeys.userId, user.id),
      if (user.email != null) _storage.write(StorageKeys.userEmail, user.email),
      if (user.displayName != null)
        _storage.write(StorageKeys.userName, user.displayName),
    ]);
  }

  Future<void> _clearPersistedUser() async {
    await Future.wait<void>([
      _storage.delete(StorageKeys.userId),
      _storage.delete(StorageKeys.userEmail),
      _storage.delete(StorageKeys.userName),
    ]);
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());

    final result = await _authRepository.signInWithEmail(
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        AppLogger.error('Email sign in failed', failure);
        emit(AuthError(failure));
      },
      (user) {
        AppLogger.info('Sign in success: ${user.id}');
        // Note: _onUserChanged will emit AuthAuthenticated
      },
    );
  }

  Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());

    final result = await _authRepository.signUpWithEmail(
      name: name,
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        AppLogger.error('Email sign up failed', failure);
        emit(AuthError(failure));
      },
      (user) {
        AppLogger.info('Sign up success: ${user.id}');
        // Note: _onUserChanged will emit AuthAuthenticated
      },
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }

  Future<void> forgotPassword(String email) async {
    emit(const AuthLoading());

    final result = await _authRepository.forgotPassword(email: email);

    result.fold(
      (failure) {
        AppLogger.error('Forgot password failed', failure);
        emit(AuthError(failure));
      },
      (_) {
        AppLogger.info('Password reset email sent to: $email');
        emit(const AuthPasswordResetSent());
      },
    );
  }

  @override
  Future<void> close() {
    unawaited(_userSubscription?.cancel());
    return super.close();
  }
}
