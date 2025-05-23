import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/errors/handle_error.dart';
import 'supabase_init.dart';

class AuthService {
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
        },
      );
      final user = response.user;
      if (user != null) {
        // Insert user information into the 'users' table
        await supabaseClient.from('users').insert({
          'user_id': user.id,
          'email': email,
          'username': name,
        });

        await Future.wait([
          // Create an entry in the 'profiles' table for the user
          supabaseClient.from('profiles').insert({
            'user_id': user.id,
          }),

          // Create a cart for the user in the 'cart' table
          supabaseClient.from('carts').insert({
            'user_id': user.id,
          }),
        ]);
        signIn(email: email, password: password);
      }
      return response;
    } catch (e) {
      throw HandleError.handle(e);
    }
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth
          .signInWithPassword(email: email, password: password);
      return response;
    } catch (e) {
      throw HandleError.handle(e);
    }
  }

  Future<bool> checkLoginStatus() async {
    try {
      final session = await supabaseClient.auth.currentSession;
      if (session != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw HandleError.handle(e);
    }
  }

  Future<void> signOut() async {
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
      throw HandleError.handle(e);
    }
  }
}
