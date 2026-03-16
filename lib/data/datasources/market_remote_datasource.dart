import 'package:flutter_application_1/core/network/api_client.dart';
import 'package:flutter_application_1/data/models/market_symbol_model.dart';

abstract class MarketRemoteDataSource {
  Future<List<MarketSymbolModel>> getWatchlistSymbols();
  Future<MarketSymbolModel> getSymbolDetail(String symbolId);
}

class MarketRemoteDataSourceImpl implements MarketRemoteDataSource {
  final ApiClient client;

  MarketRemoteDataSourceImpl(this.client);

  @override
  Future<List<MarketSymbolModel>> getWatchlistSymbols() async {
    // TODO: implement with real API
    return [];
  }

  @override
  Future<MarketSymbolModel> getSymbolDetail(String symbolId) async {
    // TODO: implement with real API
    throw UnimplementedError();
  }
}

