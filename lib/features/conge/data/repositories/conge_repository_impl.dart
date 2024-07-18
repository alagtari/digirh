import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/errors/exceptions.dart';
import 'package:digirh/core/errors/failures.dart';
import 'package:digirh/features/conge/data/data_sources/conge_remote_data_source.dart';
import 'package:digirh/features/conge/data/models/conge_model.dart';
import 'package:digirh/features/conge/domain/repositories/conge_repository.dart';

class CongeRepositoryImpl implements CongeRepository {
  final CongeOnlineDataSource dataSource;

  CongeRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, Unit>> addConge(CongeModel request) async {
    try {
      final res = await dataSource.addConge(request);
      log(res.toString());
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

  @override
  Future<Either<AppFailure, Unit>> deleteConge(String id) async {
    try {
      final res = await dataSource.deleteConge(id);
      log(res.toString());
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

  @override
  Future<Either<AppFailure, ResponseWrapper<List<CongeModel>>>>
      getConges() async {
    try {
      final res = await dataSource.getConges();
      log(res.toString());
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

  @override
  Future<Either<AppFailure, Unit>> updateConge(
      CongeModel request, String id) async {
    try {
      final res = await dataSource.updateConge(request, id);
      log(res.toString());
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
