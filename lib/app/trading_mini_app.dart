import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/trading_app_init_options.dart';
import 'package:flutter_application_1/core/branding/brand_theme_provider.dart';
import 'package:flutter_application_1/core/theme/app_theme.dart';
import 'package:flutter_application_1/presentation/routes/app_router.dart';
import 'package:flutter_application_1/presentation/shell/app_shell.dart';

Widget createTradingApp(TradingAppInitOptions options) {
  final theme = AppTheme.fromBrand(options.brand);

  final content = BrandThemeProvider(
    brand: options.brand,
    child: const AppShell(),
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

