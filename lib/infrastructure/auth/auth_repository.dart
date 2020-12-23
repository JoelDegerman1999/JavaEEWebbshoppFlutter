import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce/domain/auth/token.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRepository {
  final Dio dio;

  const AuthRepository(this.dio);

  Future<Token> login(String email, String password) async {
    try {
      final response = await dio.post(
        "https://iths-webshop.herokuapp.com/api/auth/login",
        data: {"username": email, "password": password},
        options: Options(
          headers: {
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.contentTypeHeader: "application/json"
          },
        ),
      );
      return Token.fromMap(response.data as Map<String, dynamic>);
    } on DioError catch (_) {
      return null;
    }
  }
}
