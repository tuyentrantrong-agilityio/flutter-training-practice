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

  Future<bool> checkLoginStatus();

  Future<void> signOut();
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

  @override
  Future<bool> checkLoginStatus() async {
    try {
      return await _authService.checkLoginStatus();
    } catch (e) {
      debugPrint('Check login status error: $e');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _authService.signOut();
    } catch (e) {
      debugPrint('Sign out error: $e');
      rethrow;
    }
  }
}
