import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notiva/core/storage/app_storage.dart';
import 'package:notiva/core/storage/storage_keys.dart';
import 'package:notiva/features/auth/domain/entities/auth_failure.dart';
import 'package:notiva/features/auth/domain/entities/auth_user.dart';
import 'package:notiva/features/auth/domain/repositories/auth_repository.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_state.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAppStorage extends Mock implements AppStorage {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late MockAppStorage mockAppStorage;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockAppStorage = MockAppStorage();

    when(() => mockAuthRepository.user).thenAnswer((_) => const Stream.empty());
    when(() => mockAppStorage.read<String>(any())).thenReturn(null);
    when(
      () => mockAuthRepository.validateSession(),
    ).thenAnswer((_) async => const Right(unit));
  });

  group('AuthCubit initialization', () {
    test('should emit AuthAuthenticated if user is persisted', () async {
      when(
        () => mockAppStorage.read<String>(StorageKeys.userId),
      ).thenReturn('123');
      when(
        () => mockAppStorage.read<String>(StorageKeys.userEmail),
      ).thenReturn('test@eb.com');
      when(
        () => mockAppStorage.read<String>(StorageKeys.userName),
      ).thenReturn('Test');

      final cubit = AuthCubit(mockAuthRepository, mockAppStorage);

      expect(
        cubit.state,
        const AuthAuthenticated(
          AuthUser(id: '123', email: 'test@eb.com', displayName: 'Test'),
        ),
      );
      await cubit.close();
    });

    test(
      'should emit AuthSessionExpired if persisted user is invalid on startup',
      () async {
        when(
          () => mockAppStorage.read<String>(StorageKeys.userId),
        ).thenReturn('123');
        when(
          () => mockAuthRepository.validateSession(),
        ).thenAnswer((_) async => const Left(UserDisabledFailure()));
        when(() => mockAuthRepository.signOut()).thenAnswer((_) async {});

        final cubit = AuthCubit(mockAuthRepository, mockAppStorage);

        // Wait for async initialization chores
        await Future<void>.delayed(Duration.zero);

        expect(cubit.state, const AuthSessionExpired());
        verify(() => mockAuthRepository.signOut()).called(1);

        await cubit.close();
      },
    );
  });
}
