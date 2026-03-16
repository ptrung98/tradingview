import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loogix_trading/domain/entities/market_symbol.dart';
import 'package:loogix_trading/domain/usecases/get_watchlist_usecase.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final GetWatchlistUseCase getWatchlist;

  WatchlistBloc(this.getWatchlist) : super(WatchlistInitial()) {
    on<WatchlistStarted>((event, emit) async {
      emit(WatchlistLoading());
      try {
        final symbols = await getWatchlist();
        emit(WatchlistLoaded(symbols));
      } catch (e) {
        emit(WatchlistError(e.toString()));
      }
    });
  }
}
