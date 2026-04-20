import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/core/shared/list.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int index = 0;
  bool isFav = false;

  bool isMenuOpen = false;
  Set<int> favoriteProductIds = {};

  void toggleMenu() {
    isMenuOpen = !isMenuOpen;
    emit(HomeDrawerState(isMenuOpen));
  }

  void toggleFavorite(int productId) {
    if (favoriteProductIds.contains(productId)) {
      favoriteProductIds.remove(productId);
    } else {
      favoriteProductIds.add(productId);
    }
    products[index].isFavorite = favoriteProductIds.contains(productId);
    emit(HomeFavoriteToggledState(productId));
  }

  void addToCart() {
    emit(HomeAddCartState(index));
  }

  void removeToCart() {
    emit(HomeRemoveCartState(index));
  }

  void changeFav(int index) {
    if (isFav) {
      isFav = false;
    } else {
      isFav = true;
    }
    products[index].isFavorite = isFav;
    emit(HomeChangeFavState(isFav, index));
  }

  void productDetails() {
    emit(HomeProductDetailsState(index));
  }
}
