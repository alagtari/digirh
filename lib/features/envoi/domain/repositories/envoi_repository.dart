import 'package:dartz/dartz.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/errors/failures.dart';
import 'package:digirh/features/envoi/data/models/envoi_model.dart';

abstract class EnvoiRepository {
  Future<Either<AppFailure, ResponseWrapper<List<EnvoiModel>>>> getEnvois();
  Future<Either<AppFailure, ResponseWrapper<EnvoiModel>>> addEnvoi(EnvoiModel request);
  Future<Either<AppFailure, ResponseWrapper<EnvoiModel>>> updateEnvoi(EnvoiModel request, String id);
  Future<Either<AppFailure, Unit>> deleteEnvoi(String id);
}
