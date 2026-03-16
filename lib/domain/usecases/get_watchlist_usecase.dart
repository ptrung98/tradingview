import 'package:loogix_trading/domain/entities/market_symbol.dart';
import 'package:loogix_trading/domain/repositories/market_repository.dart';

class GetWatchlistUseCase {
  final MarketRepository repository;

  GetWatchlistUseCase(this.repository);

  Future<List<MarketSymbol>> call() {
    return repository.getWatchlistSymbols();
  }
}

