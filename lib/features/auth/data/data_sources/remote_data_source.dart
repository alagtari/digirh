import 'package:digirh/core/common_used/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:digirh/features/auth/data/models/auth_response_model.dart';
import 'package:digirh/features/auth/data/models/auth_request_model.dart';

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
    Dio dio = DioProvider.authInstance();
    final res = await dio.post(
      "/login",
      data: request.toJson(),
    );

    try {
      return AuthResponseModel.fromJson(res.data);
    } catch (_) {
      rethrow;
    }
  }
}
