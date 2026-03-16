import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loogix_trading/app/trading_app_init_options.dart';
import 'package:loogix_trading/core/branding/brand_theme_provider.dart';
import 'package:loogix_trading/core/theme/app_theme.dart';
import 'package:loogix_trading/data/repositories/mock_auth_repository.dart';
import 'package:loogix_trading/domain/usecases/login_usecase.dart';
import 'package:loogix_trading/domain/usecases/logout_usecase.dart';
import 'package:loogix_trading/presentation/navigation/app_router.dart';
import 'package:loogix_trading/presentation/auth_gate.dart';
import 'package:loogix_trading/presentation/features/auth/auth_bloc.dart';

Widget createTradingApp(TradingAppInitOptions options) {
  final theme = AppTheme.fromBrand(options.brand);

  final authRepository = MockAuthRepository();
  final content = BrandThemeProvider(
    brand: options.brand,
    child: BlocProvider(
      create: (_) => AuthBloc(
        loginUseCase: LoginUseCase(authRepository),
        logoutUseCase: LogoutUseCase(authRepository),
      ),
      child: const AuthGate(),
    ),
  );

  if (options.config.embedded) {
    return content;
  }

  return MaterialApp(
    navigatorKey: options.navigatorKey,
    theme: theme,
    locale: options.locale,
    onGenerateRoute: AppRouter.onGenerateRoute,
    home: content,
  );
}
