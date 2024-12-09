import 'package:flutter/material.dart';
import 'package:fishflow/product_model.dart';

class CartModel extends ChangeNotifier {
  final Map<Product, int> _items = {};

  Map<Product, int> get items => _items;

  void add(Product product) {
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + 1;
    } else {
      _items[product] = 1;
    }
    notifyListeners();
  }

  void increment(Product product) {
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + 1;
      notifyListeners();
    }
  }

  void decrement(Product product) {
    if (_items.containsKey(product) && _items[product]! > 1) {
      _items[product] = _items[product]! - 1;
      notifyListeners();
    } else if (_items.containsKey(product) && _items[product]! == 1) {
      _items.remove(product);
      notifyListeners();
    }
  }

  void remove(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  int getQuantity(Product product) {
    return _items[product] ?? 0;
  }

  int get totalItems => _items.length;
}
