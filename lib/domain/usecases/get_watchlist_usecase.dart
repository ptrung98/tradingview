import 'package:flutter_application_1/domain/entities/market_symbol.dart';
import 'package:flutter_application_1/domain/repositories/market_repository.dart';

class GetWatchlistUseCase {
  final MarketRepository repository;

  GetWatchlistUseCase(this.repository);

  Future<List<MarketSymbol>> call() {
    return repository.getWatchlistSymbols();
  }
}

