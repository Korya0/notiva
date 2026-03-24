import 'package:dartz/dartz.dart';
import 'package:notiva/features/auth/domain/entities/auth_failure.dart';
import 'package:notiva/features/auth/domain/entities/auth_user.dart';
import 'package:notiva/features/auth/domain/repositories/auth_repository.dart';

class SignInWithEmailUseCase {
  SignInWithEmailUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<AuthFailure, AuthUser>> call({
    required String email,
    required String password,
  }) async {
    return repository.signInWithEmail(email: email, password: password);
  }
}
