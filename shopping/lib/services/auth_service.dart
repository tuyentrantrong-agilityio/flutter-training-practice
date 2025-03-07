import 'package:flutter/material.dart';

import 'supabase_init.dart';

class AuthService {
  Future<void> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
        },
      );
    } catch (e) {
      // Handle sign up error
      debugPrint('Sign up error: $e');
      rethrow;
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await supabaseClient.auth
          .signInWithPassword(email: email, password: password);
    } catch (e) {
      // Handle sign in error
      debugPrint('Sign in error: $e');
      rethrow;
    }
  }
}
