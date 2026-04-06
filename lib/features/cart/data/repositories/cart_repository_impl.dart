import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../service/cart_local_data_source.dart';
import '../service/cart_remote_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl(this.localDataSource);

  @override
  List<CartItem> getCartItems() {
    return localDataSource.getItems();
  }

  @override
  void addItem(CartItem item) {
    final model = CartItemModel(
      id: item.id,
      name: item.name,
      price: item.price,
      quantity: item.quantity,
    );

    localDataSource.addItem(model);
  }

  @override
  void clearCart() {
    // TODO: implement clearCart
  }

  @override
  void updateQuantity(String id, int quantity) {
    // TODO: implement updateQuantity
  }
}