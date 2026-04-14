import 'package:rahek/features/product_details/data/models/product.dart';

class CartItemModel {
  final Product product;
  final int quantity;
  final int selectedWeight;
  final double itemSubtotal;

  CartItemModel({
    required this.product,
    required this.quantity,
    required this.selectedWeight,
    required this.itemSubtotal,
  });
  // dio
  // factory CartItemModel.fromJson(Map<String, dynamic> json) {
  //   return CartItemModel(
  //     product: Product.fromJson(json['product']),
  //     quantity: json['quantity'] ?? 1,
  //     selectedWeight: json['selectedWeight'] ?? 0,
  //     itemSubtotal: (json['itemSubtotal'] as num?)?.toDouble() ?? 0.0,
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'productId': product.id,
  //     'quantity': quantity,
  //     'selectedWeight': selectedWeight,
  //     'itemSubtotal': itemSubtotal,
  //   };
  // }

  CartItemModel copyWith({
    Product? product,
    int? quantity,
    int? selectedWeight,
    double? itemSubtotal,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedWeight: selectedWeight ?? this.selectedWeight,
      itemSubtotal: itemSubtotal ?? this.itemSubtotal,
    );
  }
}
