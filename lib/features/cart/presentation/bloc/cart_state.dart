import '../../data/model/cart_item_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> items;
  final double subTotal;
  final double shippingCost;
  final double total;

  CartLoaded({
    required this.items,
    required this.subTotal,
    required this.shippingCost,
    required this.total,
  });

  CartLoaded copyWith({
    List<CartItemModel>? items,
    double? subTotal,
    double? shippingCost,
    double? total,
  }) {
    return CartLoaded(
      items: items ?? this.items,
      subTotal: subTotal ?? this.subTotal,
      shippingCost: shippingCost ?? this.shippingCost,
      total: total ?? this.total,
    );
  }
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
