import 'package:flutter/foundation.dart';
import '../data/models/order.dart';
import '../data/models/cart_item.dart';

class OrdersProvider extends ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => List.unmodifiable(_orders);

  void addOrder({
    required List<CartItem> items,
    required double total,
    required String address,
    required String phone,
    required String method,
  }) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        items: items.map((e) => CartItem(product: e.product, quantity: e.quantity)).toList(),
        total: total,
        address: address,
        phone: phone,
        method: method,
        createdAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}