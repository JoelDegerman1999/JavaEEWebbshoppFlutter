import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Token {
  final String jwt;

  const Token(this.jwt);

  Map<String, dynamic> toMap() {
    return {
      'jwt': jwt,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Token(
      map['jwt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Token(jwt: $jwt)';
}
