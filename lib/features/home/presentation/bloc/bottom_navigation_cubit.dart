import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitial());

  static BottomNavigationCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void onPress(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        emit(BottomNavigationHome(currentIndex));
        break;
      case 1:
        emit(BottomNavigationCart(currentIndex));
        break;
      case 2:
        emit(BottomNavigationFavorite(currentIndex));
        break;
      case 3:
        emit(BottomNavigationProfile(currentIndex));
        break;
    }
  }
}
