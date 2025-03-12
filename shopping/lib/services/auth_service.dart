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

  Future<bool> isLogin() async {
    try {
      final session = await supabaseClient.auth.currentSession;
      if (session != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Handle sign out error
      debugPrint('Sign out error: $e');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
      // Handle sign out error
      debugPrint('Sign out error: $e');
      rethrow;
    }
  }
}
