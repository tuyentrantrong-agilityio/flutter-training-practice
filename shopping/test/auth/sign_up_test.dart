import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping/repositories/auth_repository.dart';

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

  group('Verify sign-up behavior with valid password and optional name', () {
    test('Verify the users enter email is empty', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockPassword,
          name: AuthMock.mockEmpty,
        ),
      ).thenThrow(AuthExceptions.emailRequired);

      expect(
        () async => await authRepository.signUp(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockPassword,
          name: AuthMock.mockEmpty,
        ),
        throwsExpectedException(AuthExceptions.emailRequired),
      );
    });

    test('Verify the users enter email invalid format', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockInvalidEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockEmpty,
        ),
      ).thenThrow(AuthExceptions.invalidEmailFormat);

      expect(
        () async => await authRepository.signUp(
          email: AuthMock.mockInvalidEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockEmpty,
        ),
        throwsExpectedException(AuthExceptions.invalidEmailFormat),
      );
    });
  });
  group('Verify sign-up behavior with invalid password and optional name', () {
    test('Verify the users enter email is empty', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockShortPassword,
          name: AuthMock.mockEmpty,
        ),
      ).thenThrow(AuthExceptions.emailRequired);

      expect(
        () async => await authRepository.signUp(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockShortPassword,
          name: AuthMock.mockEmpty,
        ),
        throwsExpectedException(AuthExceptions.emailRequired),
      );
    });

    test('Verify the users enter email invalid format', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockInvalidEmail,
          password: AuthMock.mockShortPassword,
          name: AuthMock.mockEmpty,
        ),
      ).thenThrow(AuthExceptions.invalidEmailFormat);

      expect(
        () async => await authRepository.signUp(
          email: AuthMock.mockInvalidEmail,
          password: AuthMock.mockShortPassword,
          name: AuthMock.mockEmpty,
        ),
        throwsExpectedException(AuthExceptions.invalidEmailFormat),
      );
    });
  });

  group('Verify sign-up behavior with valid email and optional name', () {
    test('Verify the users enter password is empty', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockEmpty,
          name: AuthMock.mockEmpty,
        ),
      ).thenThrow(AuthExceptions.passwordRequired);

      expect(
        () async => await authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockEmpty,
          name: AuthMock.mockEmpty,
        ),
        throwsExpectedException(AuthExceptions.passwordRequired),
      );
    });

    test('Verify the users enter password is short', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockShortPassword,
          name: AuthMock.mockEmpty,
        ),
      ).thenThrow(AuthExceptions.passwordTooShort);

      expect(
        () async => await authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockShortPassword,
          name: AuthMock.mockEmpty,
        ),
        throwsExpectedException(AuthExceptions.passwordTooShort),
      );
    });
  });
  group('Verify sign-up behavior with invalid email and optional name', () {
    test('Verify the users enter password is empty', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockEmpty,
          name: AuthMock.mockEmpty,
        ),
      ).thenThrow(AuthExceptions.passwordRequired);

      expect(
        () async => await authRepository.signUp(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockEmpty,
          name: AuthMock.mockEmpty,
        ),
        throwsExpectedException(AuthExceptions.passwordRequired),
      );
    });

    test('Verify the users enter password is short', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockShortPassword,
          name: AuthMock.mockEmpty,
        ),
      ).thenThrow(AuthExceptions.passwordTooShort);

      expect(
        () async => await authRepository.signUp(
          email: AuthMock.mockEmpty,
          password: AuthMock.mockShortPassword,
          name: AuthMock.mockEmpty,
        ),
        throwsExpectedException(AuthExceptions.passwordTooShort),
      );
    });
  });
  group('Verify for valid inputs including email, password and name', () {
    test('Verify network error', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
      ).thenThrow(AuthExceptions.networkError);

      expect(
        () async => await authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
        throwsExpectedException(AuthExceptions.networkError),
      );
    });

    test('Verify the user entered email already exists', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
      ).thenThrow(AuthExceptions.userAlreadyExists);

      expect(
        () async => await authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
        throwsExpectedException(AuthExceptions.userAlreadyExists),
      );
    });

    test('Verify 403 Forbidden error', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
      ).thenThrow(AuthExceptions.forbidden);

      expect(
        () async => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
        throwsExpectedException(AuthExceptions.forbidden),
      );
    });

    test('Verify 422 Unprocessable Entity error', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
      ).thenThrow(AuthExceptions.unprocessableEntity);

      expect(
        () async => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
        throwsExpectedException(AuthExceptions.unprocessableEntity),
      );
    });

    test('Verify 429 Too Many Requests error', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
      ).thenThrow(AuthExceptions.tooManyRequests);

      expect(
        () async => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
        throwsExpectedException(AuthExceptions.tooManyRequests),
      );
    });

    test('Verify 500 Internal Server Error', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
      ).thenThrow(AuthExceptions.internalServerError);

      expect(
        () async => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
        throwsExpectedException(AuthExceptions.internalServerError),
      );
    });

    test('Verify 501 Not Implemented error', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
      ).thenThrow(AuthExceptions.notImplemented);

      expect(
        () async => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
        throwsExpectedException(AuthExceptions.notImplemented),
      );
    });
  });
  group('Sign up success', () {
    test('Verify the users sign up without a name', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockEmpty,
        ),
      ).thenAnswer(
        (_) async => MockSignUpResult(
          isSignUpComplete: true,
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockEmpty,
          userId: AuthMock.mockUserId,
        ),
      );

      final result = await authRepository.signUp(
        email: AuthMock.mockEmail,
        password: AuthMock.mockPassword,
        name: AuthMock.mockEmpty,
      ) as MockSignUpResult;

      expect(result.isSignUpComplete, true);
      expect(result.userId, isNotNull);
      expect(result.email, AuthMock.mockEmail);
      expect(result.password, AuthMock.mockPassword);
      expect(result.name, isEmpty);
    });
    test('Sign up with valid password and email, first name', () async {
      when(
        () => authRepository.signUp(
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
        ),
      ).thenAnswer(
        (_) async => MockSignUpResult(
          isSignUpComplete: true,
          email: AuthMock.mockEmail,
          password: AuthMock.mockPassword,
          name: AuthMock.mockName,
          userId: AuthMock.mockUserId,
        ),
      );

      final result = await authRepository.signUp(
        email: AuthMock.mockEmail,
        password: AuthMock.mockPassword,
        name: AuthMock.mockName,
      ) as MockSignUpResult;

      expect(result.isSignUpComplete, true);
      expect(result.userId, isNotNull);
      expect(result.email, AuthMock.mockEmail);
      expect(result.password, AuthMock.mockPassword);
      expect(result.name, AuthMock.mockName);
    });
  });
}
