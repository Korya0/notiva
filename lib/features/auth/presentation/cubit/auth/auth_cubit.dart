import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notiva/core/utils/app_logger.dart';
import 'package:notiva/features/auth/domain/entities/auth_user.dart';
import 'package:notiva/features/auth/domain/repositories/auth_repository.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(const AuthInitial()) {
    _userSubscription = _authRepository.user.listen(_onUserChanged);
  }

  final AuthRepository _authRepository;
  late final StreamSubscription<AuthUser> _userSubscription;

  void _onUserChanged(AuthUser user) {
    if (user.isEmpty) {
      emit(const AuthUnauthenticated());
    } else {
      emit(AuthAuthenticated(user));
    }
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
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());

    final result = await _authRepository.signUpWithEmail(
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

  Future<void> signInWithGoogle() async {
    emit(const AuthLoading());

    final result = await _authRepository.signInWithGoogle();

    result.fold(
      (failure) {
        AppLogger.error('Google sign in failed or canceled', failure);
        emit(AuthError(failure));
      },
      (user) {
        AppLogger.info('Google sign in success: ${user.id}');
        // Note: _onUserChanged will emit AuthAuthenticated
      },
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }

  @override
  Future<void> close() {
    unawaited(_userSubscription.cancel());
    return super.close();
  }
}
