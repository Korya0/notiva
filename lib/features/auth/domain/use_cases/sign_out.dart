import 'package:notiva/features/auth/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  SignOutUseCase(this.repository);
  final AuthRepository repository;

  Future<void> call() async {
    return repository.signOut();
  }
}
