import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/features/product_details/data/models/product.dart';
import 'package:rahek/features/product_details/presentation/bloc/product_details_state.dart';
import 'package:rahek/features/product_details/data/models/list.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  void loadProduct(int id) {
    emit(ProductDetailsLoading());
    try {
      final product = products.firstWhere((p) => p.id == id);
      emit(
        ProductDetailsLoaded(
          product: product,
          selectedWeight: product.weight.isNotEmpty ? product.weight.first : 0,
        ),
      );
    } catch (e) {
      emit(ProductDetailsError("المنتج غير موجود"));
    }
  }

  void increment() {
    if (state is ProductDetailsLoaded) {
      final s = state as ProductDetailsLoaded;
      emit(s.copyWith(quantity: s.quantity + 1));
    }
  }

  void decrement() {
    if (state is ProductDetailsLoaded) {
      final s = state as ProductDetailsLoaded;
      if (s.quantity > 1) emit(s.copyWith(quantity: s.quantity - 1));
    }
  }

  void selectWeight(int w) {
    if (state is ProductDetailsLoaded) {
      emit((state as ProductDetailsLoaded).copyWith(selectedWeight: w));
    }
  }

  void toggleFavorite() {
    if (state is ProductDetailsLoaded) {
      final s = state as ProductDetailsLoaded;
      emit(
        s.copyWith(
          product: s.product.copyWith(isFavorite: !s.product.isFavorite),
        ),
      );
    }
  }
}
