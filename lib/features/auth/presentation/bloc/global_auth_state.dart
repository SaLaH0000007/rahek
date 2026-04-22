import '../../data/model/User.dart';

abstract class GlobalAuthState {}

class AuthInitial extends GlobalAuthState {}

class Unauthenticated extends GlobalAuthState {}

class Authenticated extends GlobalAuthState {
  final User user;
  Authenticated(this.user);
}
