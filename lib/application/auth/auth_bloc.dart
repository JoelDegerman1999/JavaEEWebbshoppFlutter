import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FlutterSecureStorage _flutterSecureStorage;
  AuthBloc(this._flutterSecureStorage) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthCheckIfAuthenticatedEvent) {
      final response = await _flutterSecureStorage.read(key: storageJwtKey);
      if (response != null) {
        yield AuthAuthenticatedState();
      } else {
        yield AuthNotAuthenticatedState();
      }
    } else if (event is AuthLogoutEvent) {
      await _flutterSecureStorage.delete(key: storageJwtKey);
      yield AuthNotAuthenticatedState();
    }
  }
}
