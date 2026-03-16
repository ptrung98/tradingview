import 'package:loogix_trading/domain/entities/market_symbol.dart';

enum OrderSide { buy, sell }

enum OrderType { market, limit }

class Order {
  final String id;
  final MarketSymbol symbol;
  final OrderSide side;
  final OrderType type;
  final double quantity;
  final double? price;

  const Order({
    required this.id,
    required this.symbol,
    required this.side,
    required this.type,
    required this.quantity,
    this.price,
  });
}
