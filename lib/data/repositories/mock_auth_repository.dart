import 'package:loogix_trading/domain/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<void> login({
    required String username,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (password.isEmpty) {
      throw Exception('Password cannot be empty');
    }
  }

  @override
  Future<void> logout() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }
}

