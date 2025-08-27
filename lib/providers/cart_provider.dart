import 'package:ecommerc/models/product.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price);
}
