import 'package:flutter/material.dart';
import 'package:loogix_trading/app/trading_app_init_options.dart';
import 'package:loogix_trading/core/branding/brand_theme_provider.dart';
import 'package:loogix_trading/core/theme/app_theme.dart';
import 'package:loogix_trading/presentation/auth_gate.dart';
import 'package:loogix_trading/presentation/navigation/app_router.dart';

Widget createTradingApp(TradingAppInitOptions options) {
  final theme = AppTheme.fromBrand(options.brand);

  final content = BrandThemeProvider(
    brand: options.brand,
    child: const AuthGate(),
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
