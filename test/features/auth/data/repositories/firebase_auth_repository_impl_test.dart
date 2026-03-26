import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notiva/core/services/connectivity_service.dart';
import 'package:notiva/features/auth/data/repositories/firebase_auth_repository_impl.dart';
import 'package:notiva/features/auth/domain/entities/auth_failure.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUser extends Mock implements User {}
class MockConnectivityService extends Mock implements ConnectivityService {}

void main() {
  late FirebaseAuthRepositoryImpl repository;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUser mockUser;
  late MockConnectivityService mockConnectivityService;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUser = MockUser();
    mockConnectivityService = MockConnectivityService();
    repository = FirebaseAuthRepositoryImpl(
      firebaseAuth: mockFirebaseAuth,
      connectivityService: mockConnectivityService,
    );
  });

  group('validateSession', () {
    test('should return Right(unit) when no user is logged in', () async {
      when(() => mockFirebaseAuth.currentUser).thenReturn(null);

      final result = await repository.validateSession();

      expect(result, const Right(unit));
      verify(() => mockFirebaseAuth.currentUser).called(1);
    });

    test('should return Right(unit) when offline', () async {
      when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
      when(() => mockConnectivityService.isConnected).thenReturn(false);

      final result = await repository.validateSession();

      expect(result, const Right(unit));
      verifyNever(() => mockUser.reload());
    });

    test('should return Right(unit) when reload succeeds', () async {
      when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
      when(() => mockConnectivityService.isConnected).thenReturn(true);
      when(() => mockUser.reload()).thenAnswer((_) async {});

      final result = await repository.validateSession();

      expect(result, const Right(unit));
      verify(() => mockUser.reload()).called(1);
    });

    test('should return Left(UserDisabledFailure) when user is disabled', () async {
      when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
      when(() => mockConnectivityService.isConnected).thenReturn(true);
      when(() => mockUser.reload()).thenThrow(
        FirebaseAuthException(code: 'user-disabled'),
      );

      final result = await repository.validateSession();

      expect(result, const Left(UserDisabledFailure()));
    });

    test('should return Left(InvalidCredentialsFailure) when user is not found (deleted)', () async {
      when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
      when(() => mockConnectivityService.isConnected).thenReturn(true);
      when(() => mockUser.reload()).thenThrow(
        FirebaseAuthException(code: 'user-not-found'),
      );

      final result = await repository.validateSession();

      expect(result, const Left(InvalidCredentialsFailure()));
    });
  });
}
