import 'package:equatable/equatable.dart';

sealed class AuthFailure extends Equatable {
  const AuthFailure();

  @override
  List<Object?> get props => [];
}

class ServerFailure extends AuthFailure {
  const ServerFailure();
}

class NetworkFailure extends AuthFailure {
  const NetworkFailure();
}

class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure();
}

class EmailAlreadyInUseFailure extends AuthFailure {
  const EmailAlreadyInUseFailure();
}

class WeakPasswordFailure extends AuthFailure {
  const WeakPasswordFailure();
}

class TooManyRequestsFailure extends AuthFailure {
  const TooManyRequestsFailure();
}

class UserDisabledFailure extends AuthFailure {
  const UserDisabledFailure();
}

class OperationNotAllowedFailure extends AuthFailure {
  const OperationNotAllowedFailure();
}

class RequiresRecentLoginFailure extends AuthFailure {
  const RequiresRecentLoginFailure();
}

class AccountExistsWithDifferentCredentialFailure extends AuthFailure {
  const AccountExistsWithDifferentCredentialFailure();
}

class InvalidActionCodeFailure extends AuthFailure {
  const InvalidActionCodeFailure();
}

class CancellationFailure extends AuthFailure {
  const CancellationFailure();
}

class UnknownAuthFailure extends AuthFailure {
  const UnknownAuthFailure();
}
