import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping/repositories/repository.dart';

import '../mock_service.dart';
import 'auth_exception.dart';
import 'auth_mock.dart';

void main() {
  late AuthRepositoryImpl authRepository;
  late MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
    authRepository = AuthRepositoryImpl(mockAuthService);
  });

  group('Verify sign-up behavior with valid password', () {
    test('Verify the users enter email is empty', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockPassword,
        ),
      ).thenThrow(AuthExceptions.emailRequired);

      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockPassword,
        ),
        throwsExpectedException(AuthExceptions.emailRequired),
      );
    });

    test('Verify the users enter email invalid format', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockInvalidEmail,
          password: AuthMock.mockPassword,
        ),
      ).thenThrow(AuthExceptions.invalidEmailFormat);

      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockInvalidEmail,
          password: AuthMock.mockPassword,
        ),
        throwsExpectedException(AuthExceptions.invalidEmailFormat),
      );
    });
  });
  group('Verify sign-up behavior with invalid password', () {
    test('Verify the users enter email is empty', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockShortPassword,
        ),
      ).thenThrow(AuthExceptions.emailRequired);

      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockShortPassword,
        ),
        throwsExpectedException(AuthExceptions.emailRequired),
      );
    });

    test('Verify the users enter email invalid format', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockInvalidEmail,
          password: AuthMock.mockShortPassword,
        ),
      ).thenThrow(AuthExceptions.invalidEmailFormat);

      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockInvalidEmail,
          password: AuthMock.mockShortPassword,
        ),
        throwsExpectedException(AuthExceptions.invalidEmailFormat),
      );
    });
  });

  group('Verify sign-up behavior with valid email', () {
    test('Verify the users enter password is empty', () async {
      // Arrange
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockEmpty,
        ),
      ).thenThrow(AuthExceptions.passwordRequired);

      // Act & Assert
      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockEmpty,
        ),
        throwsExpectedException(AuthExceptions.passwordRequired),
      );
    });

    test('Verify the users enter password is short', () async {
      // Arrange
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockShortPassword,
        ),
      ).thenThrow(AuthExceptions.passwordTooShort);

      // Act & Assert
      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockShortPassword,
        ),
        throwsExpectedException(AuthExceptions.passwordTooShort),
      );
    });
  });
  group('Verify sign-up behavior with invalid email', () {
    test('Verify the users enter password is empty', () async {
      // Arrange
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockEmpty,
        ),
      ).thenThrow(AuthExceptions.passwordRequired);

      // Act & Assert
      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockEmpty,
        ),
        throwsExpectedException(AuthExceptions.passwordRequired),
      );
    });

    test('Verify the users enter password is short', () async {
      // Arrange
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockShortPassword,
        ),
      ).thenThrow(AuthExceptions.passwordTooShort);

      // Act & Assert
      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockShortPassword,
        ),
        throwsExpectedException(AuthExceptions.passwordTooShort),
      );
    });
  });
  group('Verify for valid inputs including email, password', () {
    test('Verify network error', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
      ).thenThrow(AuthExceptions.networkError);

      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
        throwsExpectedException(AuthExceptions.networkError),
      );
    });

    test('Verify the users enter password is incorrect', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
      ).thenThrow(AuthExceptions.incorrectCredentials);

      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
        throwsExpectedException(AuthExceptions.incorrectCredentials),
      );
    });

    test('Verify 403 Forbidden error', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
      ).thenThrow(AuthExceptions.forbidden);

      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
        throwsExpectedException(AuthExceptions.forbidden),
      );
    });

    test('Verify 422 Unprocessable Entity error', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
      ).thenThrow(AuthExceptions.unprocessableEntity);

      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
        throwsExpectedException(AuthExceptions.unprocessableEntity),
      );
    });

    test('Verify 429 Too Many Requests error', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
      ).thenThrow(AuthExceptions.tooManyRequests);

      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
        throwsExpectedException(AuthExceptions.tooManyRequests),
      );
    });

    test('Verify 500 Internal Server Error', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
      ).thenThrow(AuthExceptions.internalServerError);

      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
        throwsExpectedException(AuthExceptions.internalServerError),
      );
    });

    test('Verify 501 Not Implemented error', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
      ).thenThrow(AuthExceptions.notImplemented);

      expect(
        () async => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
        throwsExpectedException(AuthExceptions.notImplemented),
      );
    });
  });

  group('Sign in success', () {
    test('Sign in with valid password and email', () async {
      when(
        () => authRepository.signIn(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
      ).thenAnswer(
        (_) async => MockSignInResult(
          isSignedIn: true,
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
        ),
      );

      final result = await authRepository.signIn(
        email: AuthMock.mockEmail,
        password: AuthMock.mockPassword,
      ) as MockSignInResult;

      expect(result.isSignedIn, true);
      expect(result.email, AuthMock.mockEmail);
      expect(result.password, AuthMock.mockPassword);
    });
  });
}
