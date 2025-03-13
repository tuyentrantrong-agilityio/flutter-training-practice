import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user.dart';
import '../repositories/auth_repository.dart';
import '../services/storage/storage.dart';
import '../services/supabase_init.dart';
import 'repository_provider.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _authService;

  @override
  User build() {
    _authService = ref.read(authServiceProvider);
    fetchUser();
    return const User(
      username: '',
      email: '',
      userId: '',
    );
  }

  Future<void> fetchUser() async {
    try {
      final session = await checkLoginStatus();
      if (session) {
        final userId = supabaseClient.auth.currentUser!.id;
        UserStorage.setUserId(userId);
        state = User(
          username: '',
          email: '',
          userId: userId,
        );
      } else {
        state = const User(
          username: '',
          email: '',
          userId: '',
        );
      }
    } catch (e) {
      // Handle error
      state = const User(
        username: '',
        email: '',
        userId: '',
      );
    }
  }

  Future<void> signUp(
    String email,
    String password,
    String name,
  ) async {
    try {
      return await _authService.signUp(
        email: email,
        password: password,
        name: name,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _authService.signIn(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkLoginStatus() async {
    try {
      return await _authService.checkLoginStatus();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      state = const User(
        username: '',
        email: '',
        userId: '',
      );
      await _authService.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
