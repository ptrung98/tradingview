import 'package:loogix_trading/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> call({
    required String username,
    required String password,
  }) {
    return repository.login(username: username, password: password);
  }
}

