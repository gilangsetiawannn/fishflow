import 'package:flutter/material.dart';
import 'package:fishflow/product_model.dart';

class CartModel extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
