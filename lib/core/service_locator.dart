import 'package:get_it/get_it.dart';
import 'package:loogix_trading/data/repositories/mock_auth_repository.dart';
import 'package:loogix_trading/domain/repositories/auth_repository.dart';
import 'package:loogix_trading/domain/usecases/login_usecase.dart';
import 'package:loogix_trading/domain/usecases/logout_usecase.dart';
import 'package:loogix_trading/presentation/features/auth/auth_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register repositories
  final authRepository = MockAuthRepository();
  getIt.registerSingleton<AuthRepository>(authRepository);

  // Register use cases
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(authRepository));
  getIt.registerSingleton<LogoutUseCase>(LogoutUseCase(authRepository));

  // Register BLoCs
  getIt.registerSingleton<AuthBloc>(
    AuthBloc(
      loginUseCase: getIt<LoginUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
    ),
  );
}
