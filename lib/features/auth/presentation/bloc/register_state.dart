abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterFormUpdated extends RegisterState {
  final bool isFormValid;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;

  RegisterFormUpdated({
    required this.isFormValid,
    required this.isPasswordVisible,
    required this.isConfirmPasswordVisible,
  });
}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure(this.error);
}
