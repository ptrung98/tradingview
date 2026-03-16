import 'package:flutter/material.dart';
import 'package:loogix_trading/core/branding/brand_config.dart';

class AppTheme {
  static ThemeData fromBrand(BrandConfig brand) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: brand.primaryColor,
      primary: brand.primaryColor,
      secondary: brand.secondaryColor,
      background: brand.backgroundColor,
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: brand.backgroundColor,
      useMaterial3: true,
    );
  }
}

