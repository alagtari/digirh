import 'package:dartz/dartz.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/errors/failures.dart';
import 'package:digirh/features/news/data/models/news_model.dart';

abstract class NewsRepository {
  Future<Either<AppFailure, ResponseWrapper<List<NewsModel>>>> getNewss();
  Future<Either<AppFailure, ResponseWrapper<NewsModel>>> addNews(NewsModel request);
  Future<Either<AppFailure, ResponseWrapper<NewsModel>>> updateNews(NewsModel request, String id);
  Future<Either<AppFailure, Unit>> deleteNews(String id);
}
