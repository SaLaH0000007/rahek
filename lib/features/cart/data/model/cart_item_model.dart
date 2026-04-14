class CartItemModel {
  final int productId;
  final String name;
  final String image;
  final double price;
  final int quantity; // الكمية

  CartItemModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  // 1. الدالة دي مهمة جداً للـ Cubit عشان تزود أو تنقص الكمية جوه الـ UI
  CartItemModel copyWith({
    int? productId,
    String? name,
    String? image,
    double? price,
    int? quantity,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  // factory CartItemModel.fromJson(Map<String, dynamic> json) {
  //   return CartItemModel(
  //     productId: json['product_id'] ?? 0,
  //     name: json['name'] ?? '',
  //     image: json['image'] ?? '',
  //     price: (json['price'] ?? 0).toDouble(),
  //     quantity: json['quantity'] ?? 1,
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'product_id': productId,
  //     'name': name,
  //     'image': image,
  //     'price': price,
  //     'quantity': quantity,
  //   };
  // }
}
