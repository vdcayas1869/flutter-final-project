import 'product.dart';

class CartItem {
  final Product product;
  int quantity;
  final Map<String, String>? selectedOptions; // For size, color, etc.

  CartItem({required this.product, this.quantity = 1, this.selectedOptions});

  double get totalPrice => product.price * quantity;
}
