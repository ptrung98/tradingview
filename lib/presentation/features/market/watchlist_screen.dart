import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loogix_trading/data/repositories/mock_market_repository.dart';
import 'package:loogix_trading/domain/usecases/get_watchlist_usecase.dart';
import 'package:loogix_trading/presentation/features/market/watchlist_bloc.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WatchlistBloc(
        GetWatchlistUseCase(MockMarketRepository()),
      )..add(const WatchlistStarted()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist'),
        ),
        body: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            if (state is WatchlistLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WatchlistLoaded) {
              if (state.symbols.isEmpty) {
                return const Center(child: Text('No symbols'));
              }
              return ListView.builder(
                itemCount: state.symbols.length,
                itemBuilder: (context, index) {
                  final symbol = state.symbols[index];
                  return ListTile(
                    title: Text(symbol.code),
                    subtitle: Text(symbol.name),
                  );
                },
              );
            }
            if (state is WatchlistError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('Watchlist'));
          },
        ),
      ),
    );
  }
}

