import '../../data/models/product.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsError extends ProductDetailsState {
  final String message;
  ProductDetailsError(this.message);
}

class ProductDetailsLoaded extends ProductDetailsState {
  final Product product;
  final int quantity;
  final int selectedWeight;

  ProductDetailsLoaded({
    required this.product,
    this.quantity = 1,
    required this.selectedWeight,
  });

  ProductDetailsLoaded copyWith({
    Product? product,
    int? quantity,
    int? selectedWeight,
  }) {
    return ProductDetailsLoaded(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedWeight: selectedWeight ?? this.selectedWeight,
    );
  }
}
