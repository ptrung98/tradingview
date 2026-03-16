import 'package:flutter_application_1/data/datasources/market_remote_datasource.dart';
import 'package:flutter_application_1/domain/entities/market_symbol.dart';
import 'package:flutter_application_1/domain/repositories/market_repository.dart';

class MarketRepositoryImpl implements MarketRepository {
  final MarketRemoteDataSource remote;

  MarketRepositoryImpl(this.remote);

  @override
  Future<List<MarketSymbol>> getWatchlistSymbols() async {
    final models = await remote.getWatchlistSymbols();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<MarketSymbol> getSymbolDetail(String symbolId) async {
    final model = await remote.getSymbolDetail(symbolId);
    return model.toEntity();
  }
}

