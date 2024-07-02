import 'package:dartz/dartz.dart';
import 'package:digirh/core/errors/failures.dart';
import 'package:digirh/features/auth/data/models/auth_response_model.dart';
import 'package:digirh/features/auth/data/models/auth_request_model.dart';

abstract class AuthRepository {
  Future<Either<AppFailure, AuthResponseModel>> login(
      {required AuthRequestModel user});
}
