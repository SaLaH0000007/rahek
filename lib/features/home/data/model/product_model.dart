class ProductModel {
  final String image;
  final double price;

  ProductModel({
    required this.image,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['thumbNail'] ??
          json['productImage'] ??
          json['image'] ??
          '',
      price: (json['price'] is num)
          ? (json['price'] as num).toDouble()
          : double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
    );
  }
}