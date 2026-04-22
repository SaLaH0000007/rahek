import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import 'global_auth_cubit.dart';

class LoginCubit extends Cubit<LoginState> {
  final GlobalAuthCubit globalAuthCubit;

  LoginCubit({required this.globalAuthCubit}) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  String email = '';
  String password = '';
  bool isPasswordVisible = false;
  bool rememberMe = false;

  void updateEmail(String val) {
    email = val;
    _emitFormState();
  }

  void updatePassword(String val) {
    password = val;
    _emitFormState();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    _emitFormState();
  }

  void toggleRememberMe(bool? val) {
    rememberMe = val ?? false;
    _emitFormState();
  }

  bool get _isValid => email.isNotEmpty && password.isNotEmpty;

  Future<void> submitLogin() async {
    if (!_isValid) return;

    emit(LoginLoading());

    // Simulate network delay for professional UX
    await Future.delayed(const Duration(seconds: 1));

    try {
      globalAuthCubit.authenticateUser(email, password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString().replaceAll("Exception: ", "")));
      _emitFormState(); // Restore form state after failure
    }
  }

  void _emitFormState() {
    emit(
      LoginFormUpdated(
        isFormValid: _isValid,
        isPasswordVisible: isPasswordVisible,
        rememberMe: rememberMe,
      ),
    );
  }
}
