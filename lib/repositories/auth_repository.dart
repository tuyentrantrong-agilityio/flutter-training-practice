import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/auth_service.dart';

abstract class AuthRepository {
  FutureOr<AuthResponse> signUp({
    required String email,
    required String password,
    String? name,
  });

  FutureOr<AuthResponse> signIn({
    required String email,
    required String password,
  });

  FutureOr<bool> checkLoginStatus();

  FutureOr<void> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  FutureOr<AuthResponse> signUp({
    required String email,
    required String password,
    String? name,
  }) {
    return _authService.signUp(
      email: email,
      password: password,
      name: name,
    );
  }

  @override
  FutureOr<AuthResponse> signIn({
    required String email,
    required String password,
  }) {
    return _authService.signIn(
      email: email,
      password: password,
    );
  }

  @override
  FutureOr<bool> checkLoginStatus() {
    return _authService.checkLoginStatus();
  }

  @override
  FutureOr<void> signOut() {
    _authService.signOut();
  }
}
