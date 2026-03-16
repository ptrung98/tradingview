import 'package:flutter_application_1/domain/entities/market_symbol.dart';

abstract class MarketRepository {
  Future<List<MarketSymbol>> getWatchlistSymbols();
  Future<MarketSymbol> getSymbolDetail(String symbolId);
}

