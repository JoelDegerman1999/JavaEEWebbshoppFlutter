part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthCheckIfAuthenticatedEvent extends AuthEvent {}

class AuthLogoutEvent extends AuthEvent {}
