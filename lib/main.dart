import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loogix_trading/app/trading_app_init_options.dart';
import 'package:loogix_trading/app/trading_mini_app.dart';
import 'package:loogix_trading/core/branding/brand_config.dart';
import 'package:loogix_trading/core/config/app_config.dart';
import 'package:loogix_trading/data/repositories/mock_auth_repository.dart';
import 'package:loogix_trading/domain/usecases/login_usecase.dart';
import 'package:loogix_trading/domain/usecases/logout_usecase.dart';
import 'package:loogix_trading/presentation/features/auth/auth_bloc.dart';

void main() {
  const appConfig = AppConfig(baseUrl: 'https://api.example.com');
  const brand = BrandConfig.defaultBrand;

  final app = createTradingApp(
    TradingAppInitOptions(brand: brand, config: appConfig),
  );

  runApp(
    BlocProvider(
      create: (context) => AuthBloc(
        loginUseCase: LoginUseCase(MockAuthRepository()),
        logoutUseCase: LogoutUseCase(MockAuthRepository()),
      ),
      child: app,
    ),
  );
}
