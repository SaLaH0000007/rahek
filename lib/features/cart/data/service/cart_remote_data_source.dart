import 'cart_local_data_source.dart';

class CartLocalDataSource {
  final List<CartItemModel> _items = [];

  List<CartItemModel> getItems() => _items;

  void addItem(CartItemModel item) {
    _items.add(item);
  }

  void clear() {
    _items.clear();
  }
}