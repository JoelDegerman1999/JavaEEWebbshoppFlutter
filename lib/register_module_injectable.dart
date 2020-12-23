import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  Dio get dio => Dio();
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();
}
