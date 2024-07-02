import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/news/data/models/news_model.dart';

abstract class NewsOnlineDataSource {
  Future<ResponseWrapper<List<NewsModel>>> getNewss();
  Future<ResponseWrapper<NewsModel>> addNews(NewsModel news);
  Future<ResponseWrapper<NewsModel>> updateNews(NewsModel news, String id);
  Future<Unit> deleteNews(String id);
}

class NewsOnlineDataSourceImpl implements NewsOnlineDataSource {
  @override
  Future<ResponseWrapper<NewsModel>> addNews(NewsModel news) async {
    final res = await sl<Dio>().post(
      "/news",
      data: news.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => NewsModel.fromJson(p0));
  }

  @override
  Future<Unit> deleteNews(String id) async {
    await sl<Dio>().delete(
      "/news/$id",
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<List<NewsModel>>> getNewss() async {
    final res = await sl<Dio>().get(
      "/news",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<NewsModel> newsList = [];
        for (var news in p0 as List) {
          newsList.add(NewsModel.fromJson(news));
        }
        return newsList ;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseWrapper<NewsModel>>updateNews(NewsModel news, String id) async {
    final res = await sl<Dio>().patch(
      "/news/$id",
      data: news.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => NewsModel.fromJson(p0));
  }
}
