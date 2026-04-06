import '../../domain/entities/cart_item.dart';

class CartState {
  final List<CartItem> items;

  CartState(this.items);

  double get subtotal =>
      items.fold(0, (sum, item) => sum + item.price * item.quantity);
}