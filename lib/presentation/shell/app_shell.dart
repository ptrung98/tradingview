import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loogix_trading/presentation/features/market/watchlist_screen.dart';
import 'package:loogix_trading/presentation/features/portfolio/portfolio_screen.dart';
import 'package:loogix_trading/presentation/features/trade/place_order_screen.dart';
import 'package:loogix_trading/presentation/features/auth/auth_bloc.dart';
import 'package:loogix_trading/presentation/features/auth/auth_event.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const WatchlistScreen(),
    const PlaceOrderScreen(),
    const PortfolioScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loogix Trading'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: () {
              context.read<AuthBloc>().add(const AuthLogoutRequested());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Market',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.swap_vert), label: 'Trade'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Portfolio',
          ),
        ],
      ),
    );
  }
}
