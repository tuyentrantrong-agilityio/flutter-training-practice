import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user.dart';
import '../repositories/auth_repository.dart';
import 'repository_provider.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _authService;

  @override
  User build() {
    _authService = ref.read(authServiceProvider);
    // fetchUser();
    return const User(
      username: '',
      email: '',
    );
  }

  // Future<void> fetchUser() async {
  //   try {
  //     final session = await Amplify.Auth.fetchAuthSession();
  //     if (session.isSignedIn) {
  //       final user = await Amplify.Auth.getCurrentUser();
  //       Debug.log.d(user.signInDetails);
  //       final email =
  //           (user.signInDetails as auth.CognitoSignInDetailsApiBased).username;
  //       UserStorage.setUserId(user.username);
  //       UserStorage.setUserEmail(email);
  //       final userSetting = await _authService.getUserSettings();
  //       Debug.log.d("user ID: ${user.userId}");
  //       state = UserAuthState(
  //         uid: user.userId,
  //         email: email,
  //         userSettings: userSetting ?? state.userSettings,
  //       );
  //     } else {
  //       state = const UserAuthState();
  //     }
  //   } catch (e) {
  //     // Handle error
  //     state = const UserAuthState();
  //   }
  // }

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

  // Future<void> signOut() async {
  //   try {
  //     state = const UserAuthState();
  //     await _authService.signOut();
  //     AppLocalPersistentStorage().clearAll();
  //   } catch (e) {
  //     rethrow;
  //   }
}
