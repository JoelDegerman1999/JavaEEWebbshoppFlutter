part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthNotAuthenticatedState extends AuthState {}

class AuthAuthenticatedState extends AuthState {}
