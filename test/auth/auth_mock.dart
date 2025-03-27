import 'package:supabase_flutter/supabase_flutter.dart';

class AuthMock {
  // Mock email
  static const String mockEmail = 'test@example.com';
  static const String mockInvalidEmail = 'invalid-email';
  static const String mockEmpty = '';

  // Mock password
  static const String mockPassword = 'tuyen123456';
  static const String mockShortPassword = 'short';
  static const String mockNewPassword = 'trantrongtuyen';

  // Mock first name
  static const String mockName = 'Tuyen';

  // Mock user id
  static const String mockUserId = 'test-user-id';
}

class MockSignUpResult extends AuthResponse {
  final String email;
  final String password;
  final String? name;
  final bool isSignUpComplete;
  final String userId;

  MockSignUpResult({
    required this.userId,
    required this.email,
    required this.password,
    required this.isSignUpComplete,
    this.name,
  });
}

class MockSignInResult extends AuthResponse {
  final String email;
  final String password;
  final bool isSignedIn;

  MockSignInResult({
    required this.email,
    required this.password,
    required this.isSignedIn,
  });
}
