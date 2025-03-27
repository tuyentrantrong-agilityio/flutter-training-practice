import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping/repositories/repository.dart';

import '../mock_service.dart';

void main() {
  late AuthRepositoryImpl authRepository;
  late MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
    authRepository = AuthRepositoryImpl(mockAuthService);
  });

  group('checkLoginStatus', () {
    test('returns true when session is not null', () async {
      when(() => authRepository.checkLoginStatus())
          .thenAnswer((_) async => true);
      final result = await authRepository.checkLoginStatus();
      expect(result, true);
    });

    test('returns false when session is null', () async {
      when(() => authRepository.checkLoginStatus())
          .thenAnswer((_) async => false);
      final result = await authRepository.checkLoginStatus();
      expect(result, false);
    });

    test('throws an exception when an error occurs', () async {
      when(() => authRepository.checkLoginStatus()).thenThrow(Exception(''));
      expect(
        () => authRepository.checkLoginStatus(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
