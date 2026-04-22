abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginFormUpdated extends LoginState {
  final bool isFormValid;
  final bool isPasswordVisible;
  final bool rememberMe;

  LoginFormUpdated({
    required this.isFormValid,
    required this.isPasswordVisible,
    required this.rememberMe,
  });
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}
