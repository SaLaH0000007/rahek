abstract class MenuState {}

class MenuInitialState extends MenuState {}

class MenuToggledState extends MenuState {
  final bool isMenuOpen;
  MenuToggledState(this.isMenuOpen);
}
