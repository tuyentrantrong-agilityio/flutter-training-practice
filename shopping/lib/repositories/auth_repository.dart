import 'package:flutter/material.dart';

import '../services/auth_service.dart';

abstract class AuthRepository {
  Future<void> signUp({
    required String email,
    required String password,
    String? name,
  });

  Future<void> signIn({
    required String email,
    required String password,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<void> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      await _authService.signUp(
        email: email,
        password: password,
        name: name,
      );
    } catch (e) {
      // Handle sign up error
      debugPrint('Sign up error: $e');
      rethrow;
    }
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _authService.signIn(
        email: email,
        password: password,
      );
    } catch (e) {
      // Handle sign in error
      debugPrint('Sign in error: $e');
      rethrow;
    }
  }
}
