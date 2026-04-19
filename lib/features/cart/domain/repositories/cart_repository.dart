import '../entities/cart_item.dart';

abstract class CartRepository {
  List<CartItem> getCartItems();
  void addItem(CartItem item);
  void updateQuantity(String id, int quantity);
  void clearCart();
}