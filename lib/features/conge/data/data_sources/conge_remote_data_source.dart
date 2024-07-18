import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/conge/data/models/conge_model.dart';

abstract class CongeOnlineDataSource {
  Future<ResponseWrapper<List<CongeModel>>> getConges();
  Future<Unit> addConge(CongeModel conge);
  Future<Unit> updateConge(CongeModel conge, String id);
  Future<Unit> deleteConge(String id);
}

class CongeOnlineDataSourceImpl implements CongeOnlineDataSource {
  @override
  Future<Unit> addConge(CongeModel conge) async {
    await sl<Dio>().post(
      "/conge",
      data: conge.toJson(),
    );
    return unit;
  }

  @override
  Future<Unit> deleteConge(String id) async {
    await sl<Dio>().delete(
      "/conge/$id",
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<List<CongeModel>>> getConges() async {
    final res = await sl<Dio>().get(
      "/conge",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<CongeModel> congeList = [];
        for (var conge in p0 as List) {
          congeList.add(CongeModel.fromJson(conge));
        }
        return congeList ;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> updateConge(CongeModel conge, String id) async {
    await sl<Dio>().patch(
      "/conge/$id",
      data: conge.toJson(),
    );
    return unit;
  }
}
