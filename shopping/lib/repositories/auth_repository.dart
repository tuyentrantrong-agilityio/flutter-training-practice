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
    await _authService.signUp(
      email: email,
      password: password,
      name: name,
    );
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _authService.signIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<bool> checkLoginStatus() async {
    return _authService.checkLoginStatus();
  }

  @override
  Future<void> signOut() async {
    await _authService.signOut();
  }
}
