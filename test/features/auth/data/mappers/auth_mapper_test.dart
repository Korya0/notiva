import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:notiva/features/auth/data/mappers/auth_mapper.dart';
import 'package:notiva/features/auth/domain/entities/auth_user.dart';

// 🧪 Step 1: Create a "Fake" (Mock) version of the external class.
class MockUser extends Mock implements firebase_auth.User {}

void main() {
  // 🧪 Step 2: Use "group" to organize your tests.
  group('AuthMapper', () {
    
    // 🧪 Step 3: Test a "Success" or "Normal" case.
    test('should return AuthUser.empty when firebaseUser is null', () {
      // Act
      final result = AuthMapper.toDomain(null);
      
      // Expect
      expect(result, equals(AuthUser.empty));
    });

    // 🧪 Step 4: Test a "Mapping" case with a Mock.
    test('should map firebase_auth.User to AuthUser correctly', () {
      // Arrange (Setup the fake user)
      final mockUser = MockUser();
      
      // Tell the mock what to return when asked for properties
      when(() => mockUser.uid).thenReturn('123');
      when(() => mockUser.email).thenReturn('test@example.com');
      when(() => mockUser.displayName).thenReturn('Test User');
      when(() => mockUser.photoURL).thenReturn('https://example.com/photo.png');
      when(() => mockUser.emailVerified).thenReturn(true);

      // Act (Run the actual function)
      final result = AuthMapper.toDomain(mockUser);

      // Assert (Check if the result is what we expected)
      expect(result.id, equals('123'));
      expect(result.email, equals('test@example.com'));
      expect(result.displayName, equals('Test User'));
      expect(result.photoUrl, equals('https://example.com/photo.png'));
      expect(result.isEmailVerified, isTrue);
    });
  });
}
