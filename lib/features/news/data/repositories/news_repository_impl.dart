import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/errors/exceptions.dart';
import 'package:digirh/core/errors/failures.dart';
import 'package:digirh/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:digirh/features/news/data/models/news_model.dart';
import 'package:digirh/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsOnlineDataSource dataSource;

  NewsRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<NewsModel>>> addNews(NewsModel request) async {
    try {
      final res = await dataSource.addNews(request);
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
  Future<Either<AppFailure, Unit>> deleteNews(String id) async {
    try {
      final res = await dataSource.deleteNews(id);
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
  Future<Either<AppFailure, ResponseWrapper<List<NewsModel>>>>
      getNewss() async {
    try {
      final res = await dataSource.getNewss();
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
  Future<Either<AppFailure, ResponseWrapper<NewsModel>>> updateNews(
      NewsModel request, String id) async {
    try {
      final res = await dataSource.updateNews(request, id);
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
