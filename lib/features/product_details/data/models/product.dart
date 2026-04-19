class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final String description;
  final List<int> weight;
  final double rating;
  final bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.rating,
    this.weight = const [],
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      rating: (json['rating'] as num).toDouble(),
      weight: List<int>.from(json['weight'] ?? []),
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Product copyWith({
    int? id,
    String? name,
    String? image,
    double? price,
    String? description,
    List<int>? weight,
    double? rating,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      weight: weight ?? this.weight,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
