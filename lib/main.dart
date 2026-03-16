import 'package:flutter/material.dart';
import 'package:loogix_trading/app/trading_app_init_options.dart';
import 'package:loogix_trading/app/trading_mini_app.dart';
import 'package:loogix_trading/core/branding/brand_config.dart';
import 'package:loogix_trading/core/config/app_config.dart';

void main() {
  const appConfig = AppConfig(baseUrl: 'https://api.example.com');
  const brand = BrandConfig.defaultBrand;

  final app = createTradingApp(
    TradingAppInitOptions(
      brand: brand,
      config: appConfig,
    ),
  );

  runApp(app);
}

