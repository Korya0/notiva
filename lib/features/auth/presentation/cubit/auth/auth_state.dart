import 'package:equatable/equatable.dart';
import 'package:notiva/features/auth/domain/entities/auth_failure.dart';
import 'package:notiva/features/auth/domain/entities/auth_user.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(this.user);
  final AuthUser user;

  @override
  List<Object?> get props => [user];
}

final class AuthError extends AuthState {
  const AuthError(this.failure);
  final AuthFailure failure;

  @override
  List<Object?> get props => [failure];
}

final class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}
