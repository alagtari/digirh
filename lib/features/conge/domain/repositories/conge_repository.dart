import 'package:dartz/dartz.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/errors/failures.dart';
import 'package:digirh/features/conge/data/models/conge_model.dart';

abstract class CongeRepository {
  Future<Either<AppFailure, ResponseWrapper<List<CongeModel>>>> getConges();
  Future<Either<AppFailure, Unit>> addConge(CongeModel request);
  Future<Either<AppFailure, Unit>> updateConge(CongeModel request, String id);
  Future<Either<AppFailure, Unit>> deleteConge(String id);
}
