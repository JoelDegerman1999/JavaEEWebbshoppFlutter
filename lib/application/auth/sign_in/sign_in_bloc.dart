import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/infrastructure/auth/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository _authRepository;
  final FlutterSecureStorage _flutterSecureStorage;

  SignInBloc(this._authRepository, this._flutterSecureStorage)
      : super(SignInInitialState());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is SignInLoginEvent) {
      final response = await _authRepository.login(event.email, event.password);
      if (response != null) {
        await _flutterSecureStorage.write(
            key: storageJwtKey, value: response.toJson());
        yield SignInLoggedInState();
      } else {
        yield SignInErrorState("Wrong username and/or password");
      }
    }
  }
}
