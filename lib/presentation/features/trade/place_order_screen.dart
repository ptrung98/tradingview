import 'package:flutter/material.dart';
import 'package:loogix_trading/domain/entities/order.dart';
import 'package:loogix_trading/presentation/features/trade/web_chart_view.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Place Order')),
      body: const ChartWebViewPage(),
    );
  }
}

class PlaceOrderForm extends StatefulWidget {
  const PlaceOrderForm({super.key});

  @override
  State<PlaceOrderForm> createState() => _PlaceOrderFormState();
}

class _PlaceOrderFormState extends State<PlaceOrderForm> {
  final _symbolController = TextEditingController(text: 'AAPL');
  final _quantityController = TextEditingController(text: '1');
  final _priceController = TextEditingController(text: '0');
  OrderSide _side = OrderSide.buy;
  OrderType _type = OrderType.market;

  @override
  void dispose() {
    _symbolController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submitOrder() {
    final symbol = _symbolController.text.trim();
    final quantity = double.tryParse(_quantityController.text) ?? 0;
    final price = double.tryParse(_priceController.text) ?? 0;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Order submitted: ${_side.name.toUpperCase()} $quantity $symbol @ ${_type == OrderType.market ? 'market' : price.toStringAsFixed(2)}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _symbolController,
          decoration: const InputDecoration(
            labelText: 'Symbol',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<OrderSide>(
                value: _side,
                decoration: const InputDecoration(
                  labelText: 'Side',
                  border: OutlineInputBorder(),
                ),
                items: OrderSide.values
                    .map(
                      (side) => DropdownMenuItem(
                        value: side,
                        child: Text(side.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _side = value;
                    });
                  }
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonFormField<OrderType>(
                value: _type,
                decoration: const InputDecoration(
                  labelText: 'Type',
                  border: OutlineInputBorder(),
                ),
                items: OrderType.values
                    .map(
                      (type) => DropdownMenuItem(
                        value: type,
                        child: Text(type.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _type = value;
                    });
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _quantityController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Quantity',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        if (_type == OrderType.limit) ...[
          TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Limit Price',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
        ],
        ElevatedButton(
          onPressed: _submitOrder,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Text('Place Order'),
          ),
        ),
      ],
    );
  }
}
