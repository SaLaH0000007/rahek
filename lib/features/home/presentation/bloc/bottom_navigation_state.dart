abstract class BottomNavigationState {}

final class BottomNavigationInitial extends BottomNavigationState {}

final class BottomNavigationHome extends BottomNavigationState {
  final int currentIndex;
  BottomNavigationHome(this.currentIndex);
}

final class BottomNavigationCart extends BottomNavigationState {
  final int currentIndex;
  BottomNavigationCart(this.currentIndex);
}

final class BottomNavigationFavorite extends BottomNavigationState {
  final int currentIndex;
  BottomNavigationFavorite(this.currentIndex);
}

final class BottomNavigationProfile extends BottomNavigationState {
  final int currentIndex;
  BottomNavigationProfile(this.currentIndex);
}
