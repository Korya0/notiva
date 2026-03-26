import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notiva/core/storage/app_storage.dart';
import 'package:notiva/core/storage/storage_keys.dart';
import 'package:notiva/features/auth/domain/entities/auth_user.dart';
import 'package:notiva/features/auth/domain/repositories/auth_repository.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_state.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAppStorage extends Mock implements AppStorage {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late MockAppStorage mockAppStorage;
  late StreamController<AuthUser> userStreamController;

  const testUser = AuthUser(
    id: 'test-id',
    email: 'test@example.com',
    displayName: 'Test User',
  );

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockAppStorage = MockAppStorage();
    userStreamController = StreamController<AuthUser>();

    when(
      () => mockAuthRepository.user,
    ).thenAnswer((_) => userStreamController.stream);

    // Default storage behaviors
    when(() => mockAppStorage.read<String>(any())).thenReturn(null);
    //
    // ignore: inference_failure_on_function_invocation
    when(() => mockAppStorage.write(any(), any())).thenAnswer((_) async {});
    when(() => mockAppStorage.delete(any())).thenAnswer((_) async {});
  });

  tearDown(() async {
    await userStreamController.close();
  });

  group('AuthCubit - Session Management & Navigation', () {
    test('initial state is AuthInitial', () {
      final cubit = AuthCubit(mockAuthRepository, mockAppStorage);
      expect(cubit.state, const AuthInitial());
    });

    blocTest<AuthCubit, AuthState>(
      'emits [AuthAuthenticated] when user stream sends a valid user',
      build: () => AuthCubit(mockAuthRepository, mockAppStorage),
      act: (cubit) => userStreamController.add(testUser),
      expect: () => [const AuthAuthenticated(testUser)],
      verify: (_) {
        verify(
          () => mockAppStorage.write(StorageKeys.userId, testUser.id),
        ).called(1);
        verify(
          () => mockAppStorage.write(StorageKeys.userEmail, testUser.email),
        ).called(1);
        verify(
          () =>
              mockAppStorage.write(StorageKeys.userName, testUser.displayName),
        ).called(1);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'emits [AuthSessionExpired, AuthUnauthenticated] when user stream sends null/empty user after authentication',
      build: () => AuthCubit(mockAuthRepository, mockAppStorage),
      seed: () => const AuthAuthenticated(testUser),
      act: (cubit) => userStreamController.add(AuthUser.empty),
      expect: () => [
        const AuthSessionExpired(),
        const AuthUnauthenticated(),
      ],
      verify: (_) {
        // Should clear persistence on forced logout
        verify(() => mockAppStorage.delete(StorageKeys.userId)).called(1);
        verify(() => mockAppStorage.delete(StorageKeys.userEmail)).called(1);
        verify(() => mockAppStorage.delete(StorageKeys.userName)).called(1);
      },
    );

    test('re-authenticates from local storage on startup', () async {
      when(
        () => mockAppStorage.read<String>(StorageKeys.userId),
      ).thenReturn('persisted-id');
      when(
        () => mockAppStorage.read<String>(StorageKeys.userEmail),
      ).thenReturn('persisted@email.com');
      when(
        () => mockAppStorage.read<String>(StorageKeys.userName),
      ).thenReturn('Persisted Name');

      final cubit = AuthCubit(mockAuthRepository, mockAppStorage);

      expect(cubit.state, isA<AuthAuthenticated>());
      final state = cubit.state as AuthAuthenticated;
      expect(state.user.id, 'persisted-id');
      expect(state.user.email, 'persisted@email.com');
      expect(state.user.displayName, 'Persisted Name');

      await cubit.close();
    });

    blocTest<AuthCubit, AuthState>(
      'clears storage upon manual signOut',
      build: () => AuthCubit(mockAuthRepository, mockAppStorage),
      seed: () => const AuthAuthenticated(testUser),
      act: (cubit) async {
        when(() => mockAuthRepository.signOut()).thenAnswer((_) async {});
        await cubit.signOut();
        userStreamController.add(AuthUser.empty);
      },
      expect: () => [
        const AuthSessionExpired(),
        const AuthUnauthenticated(),
      ],
      verify: (_) {
        verify(() => mockAuthRepository.signOut()).called(1);
        verify(() => mockAppStorage.delete(StorageKeys.userId)).called(1);
      },
    );
  });
}
