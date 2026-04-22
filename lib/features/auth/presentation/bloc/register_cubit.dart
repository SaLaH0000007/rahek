import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_state.dart';
import 'global_auth_cubit.dart';
import '../../data/model/User.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final GlobalAuthCubit globalAuthCubit;

  RegisterCubit({required this.globalAuthCubit}) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  String fullName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void updateName(String val) {
    fullName = val;
    _emitFormState();
  }

  void updateEmail(String val) {
    email = val;
    _emitFormState();
  }

  void updatePassword(String val) {
    password = val;
    _emitFormState();
  }

  void updateConfirmPassword(String val) {
    confirmPassword = val;
    _emitFormState();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    _emitFormState();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    _emitFormState();
  }

  bool get _isValid =>
      fullName.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword;

  Future<void> submitRegistration() async {
    if (!_isValid) return;

    emit(RegisterLoading());
    await Future.delayed(const Duration(seconds: 1));

    try {
      final newUser = User(
        id: DateTime.now().millisecondsSinceEpoch,
        email: email,
        firstName: fullName.split(' ').first,
        lastName: fullName.split(' ').length > 1
            ? fullName.split(' ').last
            : '',
        password: password,
        phone: "", // To be updated later
        isActive: true,
        dateOfBirth: "",
        gender: "",
      );

      globalAuthCubit.registerUser(newUser);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure("Registration failed. Please try again."));
      _emitFormState();
    }
  }

  void _emitFormState() {
    emit(
      RegisterFormUpdated(
        isFormValid: _isValid,
        isPasswordVisible: isPasswordVisible,
        isConfirmPasswordVisible: isConfirmPasswordVisible,
      ),
    );
  }
}
