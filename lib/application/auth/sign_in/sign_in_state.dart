part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoggedInState extends SignInState {}

class SignInErrorState extends SignInState {
  final String message;
  SignInErrorState(this.message);
}
