import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/users.dart'; // Adjust path to your users list
import '../../data/model/User.dart';
import 'global_auth_state.dart';

class GlobalAuthCubit extends Cubit<GlobalAuthState> {
  GlobalAuthCubit() : super(Unauthenticated());

  static GlobalAuthCubit get(context) => BlocProvider.of(context);

  User? currentUser;

  void authenticateUser(String email, String password) {
    try {
      // Simulating database lookup
      final user = users.firstWhere(
        (u) => u.email == email && u.password == password,
      );

      currentUser = user;
      emit(Authenticated(currentUser!));
    } catch (e) {
      throw Exception("Invalid credentials");
    }
  }

  void registerUser(User newUser) {
    // Simulating database insertion
    users.add(newUser);
    currentUser = newUser;
    emit(Authenticated(currentUser!));
  }

  void logout() {
    currentUser = null;
    emit(Unauthenticated());
  }
}
