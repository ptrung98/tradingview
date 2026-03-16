import 'package:flutter_application_1/domain/entities/market_symbol.dart';

class MarketSymbolModel {
  final String id;
  final String code;
  final String name;
  final String marketType;

  const MarketSymbolModel({
    required this.id,
    required this.code,
    required this.name,
    required this.marketType,
  });

  factory MarketSymbolModel.fromJson(Map<String, dynamic> json) {
    return MarketSymbolModel(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      marketType: json['marketType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'marketType': marketType,
    };
  }

  MarketSymbol toEntity() {
    return MarketSymbol(
      id: id,
      code: code,
      name: name,
      marketType: marketType,
    );
  }
}

