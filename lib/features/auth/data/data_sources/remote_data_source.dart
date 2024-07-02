import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/auth/data/models/auth_response_model.dart';
import 'package:digirh/features/auth/data/models/auth_request_model.dart';
import 'package:digirh/features/auth/data/models/reset_password_request_model.dart';
import 'package:digirh/features/auth/data/models/verify_code_request_model.dart';

abstract class AuthOnlineDataSource {
  Future<AuthResponseModel> login(
    AuthRequestModel request,
  );
}

class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  @override
  Future<AuthResponseModel> login(
    AuthRequestModel request,
  ) async {
    final res = await sl<Dio>().post(
      "/auth/login",
      data: request.toJson(),
    );

    try {
      return AuthResponseModel.fromJson(res.data);
    } catch (_) {
      rethrow;
    }
  }
}
