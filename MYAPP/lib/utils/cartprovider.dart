import 'package:flutter/material.dart';

import 'cartitem.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }
}
