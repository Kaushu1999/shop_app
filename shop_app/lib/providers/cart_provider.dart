import "package:flutter/material.dart";

class CartItem {
  final String id;
  final String title;
  final double price;
  final double quantity;
  final String imageUrl;

  CartItem(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.imageUrl});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get cartItems {
    return {..._items};
  }

  int get itemcount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.00;

    _items.forEach((key, value) {
      total = value.price * value.quantity;
    });
    return total;
  }

  void add(String productId, double price, String title, String imageUrl) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,

          // here we updating our cartQuanity
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
              title: existingCartItem.title,
              imageUrl: existingCartItem.imageUrl));
    } else {
      _items.putIfAbsent(
          // here we creating new cartItme
          productId,
          () => CartItem(
              id: productId,
              price: price,
              quantity: 1,
              title: title,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }

  void remove(String productId, double price, String title, String imageUrl) {
    if ((_items[productId]!.quantity) > 1) {
      _items.update(
          productId,
          // here we updating our cartQuanity
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity - 1,
              title: existingCartItem.title,
              imageUrl: existingCartItem.imageUrl));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
