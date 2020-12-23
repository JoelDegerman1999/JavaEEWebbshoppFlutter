part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInLoginEvent extends SignInEvent {
  final String email, password;
  SignInLoginEvent(this.email, this.password);
}
