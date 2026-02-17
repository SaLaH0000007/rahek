class Product {
  late final int id;
  late final String name;
  late final String image;
  late final double price;
  late final String description;
  late final List<int> weight;
  late final double rating;
  late final bool isFavorite = false;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.rating,
    this.weight = const [],
    isFavorite = false,
  });
}
