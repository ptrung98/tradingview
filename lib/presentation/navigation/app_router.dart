import 'package:flutter/material.dart';
import 'package:loogix_trading/presentation/features/auth/login_screen.dart';
import 'package:loogix_trading/presentation/features/market/watchlist_screen.dart';
import 'package:loogix_trading/presentation/features/portfolio/portfolio_screen.dart';
import 'package:loogix_trading/presentation/features/trade/place_order_screen.dart';

class AppRouter {
  static const String routeLogin = '/auth/login';
  static const String routeWatchlist = '/market/watchlist';
  static const String routePlaceOrder = '/trade/place-order';
  static const String routePortfolio = '/portfolio/overview';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeLogin:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routePlaceOrder:
        return MaterialPageRoute(builder: (_) => const PlaceOrderScreen());
      case routePortfolio:
        return MaterialPageRoute(builder: (_) => const PortfolioScreen());
      case routeWatchlist:
      default:
        return MaterialPageRoute(builder: (_) => const WatchlistScreen());
    }
  }
}

