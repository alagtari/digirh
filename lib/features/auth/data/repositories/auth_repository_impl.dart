import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/errors/exceptions.dart';
import 'package:digirh/core/errors/failures.dart';
import 'package:digirh/features/auth/data/data_sources/remote_data_source.dart';
import 'package:digirh/features/auth/data/models/auth_response_model.dart';
import 'package:digirh/features/auth/data/models/auth_request_model.dart';
import 'package:digirh/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthOnlineDataSource dataSource;

  AuthRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, AuthResponseModel>> login({
    required AuthRequestModel user,
  }) async {
    try {
      final res = await dataSource.login(user);
      return right(res);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(
        AppFailure(message: e.response?.data?["message"]),
      );
    } catch (e) {
      return Left(
        AppFailure(message: 'Unexpected error occurred.'),
      );
    }
  }
}
