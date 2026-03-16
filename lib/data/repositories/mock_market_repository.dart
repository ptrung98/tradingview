import 'package:loogix_trading/domain/entities/market_symbol.dart';
import 'package:loogix_trading/domain/repositories/market_repository.dart';

class MockMarketRepository implements MarketRepository {
  @override
  Future<List<MarketSymbol>> getWatchlistSymbols() async {
    return const [
      MarketSymbol(
        id: 'btc-usdt',
        code: 'BTC/USDT',
        name: 'Bitcoin',
        marketType: 'crypto',
      ),
      MarketSymbol(
        id: 'eur-usd',
        code: 'EUR/USD',
        name: 'Euro / US Dollar',
        marketType: 'forex',
      ),
      MarketSymbol(
        id: 'aapl',
        code: 'AAPL',
        name: 'Apple Inc.',
        marketType: 'stock',
      ),
    ];
  }

  @override
  Future<MarketSymbol> getSymbolDetail(String symbolId) async {
    return (await getWatchlistSymbols()).firstWhere((s) => s.id == symbolId);
  }
}

