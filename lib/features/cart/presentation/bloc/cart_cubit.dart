import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/features/product_details/data/models/product.dart';
import '../../data/model/cart_item_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  final List<CartItemModel> _cartItems = [];

  void loadCart() {
    emit(CartLoading());
    // TODO: Fetch data using Dio later
    _updateCalculations();
  }

  void addToCart({
    required Product product,
    required int quantity,
    required int selectedWeight,
  }) {
    final index = _cartItems.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.selectedWeight == selectedWeight,
    );

    if (index != -1) {
      final existingItem = _cartItems[index];
      final newQuantity = existingItem.quantity + quantity;

      _cartItems[index] = existingItem.copyWith(
        quantity: newQuantity,
        itemSubtotal: product.price * newQuantity,
      );
    } else {
      _cartItems.add(
        CartItemModel(
          product: product,
          quantity: quantity,
          selectedWeight: selectedWeight,
          itemSubtotal: product.price * quantity,
        ),
      );
    }

    _updateCalculations();
  }

  void incrementItem(int index) {
    final item = _cartItems[index];
    final newQuantity = item.quantity + 1;

    _cartItems[index] = item.copyWith(
      quantity: newQuantity,
      itemSubtotal: item.product.price * newQuantity,
    );

    _updateCalculations();
  }

  void decrementItem(int index) {
    final item = _cartItems[index];

    if (item.quantity > 1) {
      final newQuantity = item.quantity - 1;
      _cartItems[index] = item.copyWith(
        quantity: newQuantity,
        itemSubtotal: item.product.price * newQuantity,
      );
    } else {
      _cartItems.removeAt(index);
    }

    _updateCalculations();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    _updateCalculations();
  }

  void clearCart() {
    _cartItems.clear();
    _updateCalculations();
  }

  void _updateCalculations() {
    double subTotal = 0.0;

    for (var item in _cartItems) {
      subTotal += item.itemSubtotal;
    }

    double shippingCost = (subTotal > 1000 || subTotal == 0) ? 0.0 : 50.0;
    double total = subTotal + shippingCost;

    emit(
      CartLoaded(
        items: List.from(_cartItems),
        subTotal: subTotal,
        shippingCost: shippingCost,
        total: total,
      ),
    );
  }
}
