import 'package:notiva/features/auth/domain/entities/auth_user.dart';
import 'package:notiva/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  GetCurrentUserUseCase(this.repository);
  final AuthRepository repository;

  AuthUser call() {
    return repository.currentUser;
  }
}
