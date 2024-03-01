import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegisterModel with EquatableMixin{
  final String username;
  final String password;
  final String email;
  RegisterModel({
    required this.username,
    required this.password,
    required this.email,
  });

  RegisterModel copyWith({
    String? username,
    String? password,
    String? email,
  }) {
    return RegisterModel(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'email': email,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source));
  
  @override
  List<Object?> get props => [];

}