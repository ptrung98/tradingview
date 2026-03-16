import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/branding/brand_config.dart';
import 'package:flutter_application_1/core/config/app_config.dart';

class TradingAppInitOptions {
  final BrandConfig brand;
  final AppConfig config;
  final Locale? locale;
  final GlobalKey<NavigatorState>? navigatorKey;

  const TradingAppInitOptions({
    required this.brand,
    required this.config,
    this.locale,
    this.navigatorKey,
  });
}

