// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'application/auth/auth_bloc.dart';
import 'infrastructure/auth/auth_repository.dart';
import 'register_module_injectable.dart';
import 'application/auth/sign_in/sign_in_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<Dio>(() => registerModule.dio);
  gh.factory<FlutterSecureStorage>(() => registerModule.flutterSecureStorage);
  gh.factory<AuthBloc>(() => AuthBloc(get<FlutterSecureStorage>()));
  gh.factory<AuthRepository>(() => AuthRepository(get<Dio>()));
  gh.factory<SignInBloc>(
      () => SignInBloc(get<AuthRepository>(), get<FlutterSecureStorage>()));
  return get;
}

class _$RegisterModule extends RegisterModule {}
