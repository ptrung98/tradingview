import 'package:loogix_trading/domain/entities/market_symbol.dart';

abstract class MarketRepository {
  Future<List<MarketSymbol>> getWatchlistSymbols();
  Future<MarketSymbol> getSymbolDetail(String symbolId);
}

