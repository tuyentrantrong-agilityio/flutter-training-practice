import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping/providers/profile_provider.dart';
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
    return const User(
      username: '',
      email: '',
      userId: '',
    );
  }

  Future<void> fetchUser() async {
    try {
      final userId = supabaseClient.auth.currentUser!.id;
      final cartId = await ref.read(cartServiceProvider).getCartId(userId);
      UserStorage.setUserId(userId);
      UserStorage.setCartId(cartId);
      if (Platform.isAndroid) {
        // Request notification permissions
        await FirebaseMessaging.instance.requestPermission();
        // await FirebaseMessaging.instance.getAPNSToken();

        // Get and set FCM token
        final fcmToken = await FirebaseMessaging.instance.getToken();
        if (fcmToken != null) {
          await ref
              .watch(profileNotifierProvider.notifier)
              .setFcmToken(fcmToken);
        }
      }
      state = User(
        username: '',
        email: '',
        userId: userId,
      );
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
      await _authService.signUp(
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
      final result = await _authService.checkLoginStatus();
      if (result) fetchUser();
      return result;
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
