import 'package:digirh/core/enums/role_enum.dart';
import 'package:digirh/features/auth/domain/entities/auth_response_entity.dart';

class AuthResponseModel extends AuthResponseEntity {
  const AuthResponseModel({
    required super.accessToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['access_token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {};
  }
}
