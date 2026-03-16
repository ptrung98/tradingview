import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/branding/brand_config.dart';

class BrandThemeProvider extends InheritedWidget {
  final BrandConfig brand;

  const BrandThemeProvider({
    super.key,
    required this.brand,
    required super.child,
  });

  static BrandConfig of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<BrandThemeProvider>();
    return provider?.brand ?? BrandConfig.defaultBrand;
  }

  @override
  bool updateShouldNotify(BrandThemeProvider oldWidget) {
    return brand != oldWidget.brand;
  }
}

