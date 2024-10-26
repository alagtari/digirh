import 'package:digirh/features/auth/domain/entities/auth_request_entity.dart';

class AuthRequestModel extends AuthRequestEntity {
  const AuthRequestModel({required super.username, required super.password});

  factory AuthRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthRequestModel(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': {
        'username': username,
        'password': password,
      }
    };
  }
}
