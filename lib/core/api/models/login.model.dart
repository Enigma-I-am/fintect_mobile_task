import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginModel with EquatableMixin {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  LoginModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  LoginModel copyWith({
    String? accessToken,
    String? tokenType,
    int? expiresIn,
  }) {
    return LoginModel(
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      accessToken: map['access_token'] ?? '',
      tokenType: map['token_type'] ?? '',
      expiresIn: map['expires_in']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginModel(access_token: $accessToken, token_type: $tokenType, expires_in: $expiresIn)';

  @override
  List<Object?> get props => [accessToken, tokenType, expiresIn];
}
