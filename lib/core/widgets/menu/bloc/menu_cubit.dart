import 'package:flutter_bloc/flutter_bloc.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitialState());

  static MenuCubit get(context) => BlocProvider.of(context);

  bool isMenuOpen = false;

  void toggleMenu() {
    isMenuOpen = !isMenuOpen;
    emit(MenuToggledState(isMenuOpen));
  }
}
