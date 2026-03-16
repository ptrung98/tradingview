import 'package:flutter/material.dart';

class BrandConfig {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final String? logoAsset;
  final String? smallLogoAsset;
  final double cornerRadius;

  const BrandConfig({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    this.logoAsset,
    this.smallLogoAsset,
    this.cornerRadius = 8,
  });

  static const BrandConfig defaultBrand = BrandConfig(
    primaryColor: Colors.blue,
    secondaryColor: Colors.blueAccent,
    backgroundColor: Colors.white,
  );
}

