import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  bool get isEmpty => _items.isEmpty;

  void addItem(Map<String, String> product, int quantity) {
    final index = _items.indexWhere((item) => item['id'] == int.tryParse(product['id'] ?? '0'));

    final productId = int.tryParse(product['id'] ?? '0') ?? 0;
    final price = double.tryParse(product['price'] ?? '0') ?? 0;

    if (index != -1) {
      _items[index]['quantity'] += quantity;
    } else {
      _items.add({
        'id': productId,
        'name': product['name'] ?? '',
        'price': price,
        'image': product['image'] ?? '',
        'quantity': quantity,
        'description': product['description'] ?? '',
      });
    }

    notifyListeners();
  }

  void increaseQuantity(int productId) {
    final index = _items.indexWhere((item) => item['id'] == productId);
    if (index != -1) {
      _items[index]['quantity'] += 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(int productId) {
    final index = _items.indexWhere((item) => item['id'] == productId);
    if (index != -1) {
      if (_items[index]['quantity'] > 1) {
        _items[index]['quantity'] -= 1;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeItem(String name) {
    _items.removeWhere((item) => item['name'] == name);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get subtotal {
    double total = 0;
    for (final item in _items) {
      total += (item['price'] as double) * (item['quantity'] as int);
    }
    return total;
  }

  double get total => subtotal;
}