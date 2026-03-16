import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/trading_app_init_options.dart';
import 'package:flutter_application_1/app/trading_mini_app.dart';
import 'package:flutter_application_1/core/branding/brand_config.dart';
import 'package:flutter_application_1/core/config/app_config.dart';

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

