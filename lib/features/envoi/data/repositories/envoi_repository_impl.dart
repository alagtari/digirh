import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/errors/exceptions.dart';
import 'package:digirh/core/errors/failures.dart';
import 'package:digirh/features/envoi/data/data_sources/envoi_remote_data_source.dart';
import 'package:digirh/features/envoi/data/models/envoi_model.dart';
import 'package:digirh/features/envoi/domain/repositories/envoi_repository.dart';

class EnvoiRepositoryImpl implements EnvoiRepository {
  final EnvoiOnlineDataSource dataSource;

  EnvoiRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<EnvoiModel>>> addEnvoi(EnvoiModel request) async {
    try {
      final res = await dataSource.addEnvoi(request);
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
  Future<Either<AppFailure, Unit>> deleteEnvoi(String id) async {
    try {
      final res = await dataSource.deleteEnvoi(id);
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
  Future<Either<AppFailure, ResponseWrapper<List<EnvoiModel>>>>
      getEnvois() async {
    try {
      final res = await dataSource.getEnvois();
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
  Future<Either<AppFailure, ResponseWrapper<EnvoiModel>>> updateEnvoi(
      EnvoiModel request, String id) async {
    try {
      final res = await dataSource.updateEnvoi(request, id);
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
