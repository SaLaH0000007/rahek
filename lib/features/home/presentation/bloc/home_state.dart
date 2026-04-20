abstract class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeAddCartState extends HomeState {
  final int index;

  HomeAddCartState(this.index);
}

final class HomeRemoveCartState extends HomeState {
  final int index;

  HomeRemoveCartState(this.index);
}

final class HomeChangeFavState extends HomeState {
  final bool isFav;
  final int index;

  HomeChangeFavState(this.isFav, this.index);
}

final class HomeProductDetailsState extends HomeState {
  final int index;

  HomeProductDetailsState(this.index);
}

class HomeDrawerState extends HomeState {
  final bool isOpen;

  HomeDrawerState(this.isOpen);
}

class HomeFavoriteToggledState extends HomeState {
  final int productId;

  HomeFavoriteToggledState(this.productId);
}
