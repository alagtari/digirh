import 'package:dartz/dartz.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/errors/failures.dart';
import 'package:digirh/features/conge/data/models/conge_model.dart';
import 'package:digirh/features/conge/data/models/supervisor_conge_model.dart';
import 'package:digirh/features/conge/data/models/supervisor_model.dart';

abstract class CongeRepository {
  Future<Either<AppFailure, ResponseWrapper<List<LeaveModel>>>> getConges();
  Future<Either<AppFailure, ResponseWrapper<List<SupervisorLeaveModel>>>>
      getSupervisorConges();

  Future<Either<AppFailure, ResponseWrapper<List<SupervisorModel>>>>
      getCongeSupervisors(String congeId);
  Future<Either<AppFailure, ResponseWrapper<LeaveModel>>> addConge(
      LeaveModel request);
  Future<Either<AppFailure, Unit>> updateConge(LeaveModel request, String id);
  Future<Either<AppFailure, Unit>> deleteConge(String id);
  Future<Either<AppFailure, Unit>> submitConge(String congeId);
  Future<Either<AppFailure, Unit>> acceptConge(String congeId);
  Future<Either<AppFailure, Unit>> rejectConge(String congeId);
}
