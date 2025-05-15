import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => [..._items];

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void addItem(
      Product product, int quantity, Map<String, String>? selectedOptions) {
    final existingIndex = _items.indexWhere((item) =>
        item.product.id == product.id &&
        _compareOptions(item.selectedOptions, selectedOptions));

    if (existingIndex >= 0) {
      // Update existing item
      _items[existingIndex].quantity += quantity;
    } else {
      // Add new item
      _items.add(
        CartItem(
          product: product,
          quantity: quantity,
          selectedOptions: selectedOptions,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId, Map<String, String>? selectedOptions) {
    _items.removeWhere((item) =>
        item.product.id == productId &&
        _compareOptions(item.selectedOptions, selectedOptions));
    notifyListeners();
  }

  void updateQuantity(
      String productId, Map<String, String>? selectedOptions, int quantity) {
    final index = _items.indexWhere((item) =>
        item.product.id == productId &&
        _compareOptions(item.selectedOptions, selectedOptions));

    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index].quantity = quantity;
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  bool _compareOptions(
      Map<String, String>? options1, Map<String, String>? options2) {
    if (options1 == null && options2 == null) return true;
    if (options1 == null || options2 == null) return false;
    if (options1.length != options2.length) return false;

    return options1.entries
        .every((entry) => options2[entry.key] == entry.value);
  }
}
