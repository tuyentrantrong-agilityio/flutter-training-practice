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

  group('signOut', () {
    test('Sign out success', () async {
      when(() => authRepository.signOut()).thenAnswer((_) async {});
      expect(
        authRepository.signOut() == null,
        true,
      );
    });

    test('throws an exception when an error occurs during signOut', () async {
      when(() => authRepository.signOut()).thenThrow(Exception(''));
      expect(() => authRepository.signOut(), throwsA(isA<Exception>()));
    });
  });
}
