import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loogix_trading/app/trading_app_init_options.dart';
import 'package:loogix_trading/app/trading_mini_app.dart';
import 'package:loogix_trading/core/branding/brand_config.dart';
import 'package:loogix_trading/core/config/app_config.dart';
import 'package:loogix_trading/core/service_locator.dart';
import 'package:loogix_trading/presentation/features/auth/auth_bloc.dart';

void main() {
  setupServiceLocator();

  const appConfig = AppConfig(baseUrl: 'https://api.example.com');
  const brand = BrandConfig.defaultBrand;

  final app = MultiBlocProvider(
    providers: [BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>())],
    child: createTradingApp(
      TradingAppInitOptions(brand: brand, config: appConfig),
    ),
  );

  runApp(app);
}
