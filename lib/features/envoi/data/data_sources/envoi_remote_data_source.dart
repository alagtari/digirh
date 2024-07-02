import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/envoi/data/models/envoi_model.dart';

abstract class EnvoiOnlineDataSource {
  Future<ResponseWrapper<List<EnvoiModel>>> getEnvois();
  Future<ResponseWrapper<EnvoiModel>> addEnvoi(EnvoiModel envoi);
  Future<ResponseWrapper<EnvoiModel>> updateEnvoi(EnvoiModel envoi, String id);
  Future<Unit> deleteEnvoi(String id);
}

class EnvoiOnlineDataSourceImpl implements EnvoiOnlineDataSource {
  @override
  Future<ResponseWrapper<EnvoiModel>> addEnvoi(EnvoiModel envoi) async {
    final res = await sl<Dio>().post(
      "/envoi",
      data: envoi.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => EnvoiModel.fromJson(p0));
  }

  @override
  Future<Unit> deleteEnvoi(String id) async {
    await sl<Dio>().delete(
      "/envoi/$id",
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<List<EnvoiModel>>> getEnvois() async {
    final res = await sl<Dio>().get(
      "/envoi",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<EnvoiModel> envoiList = [];
        for (var envoi in p0 as List) {
          envoiList.add(EnvoiModel.fromJson(envoi));
        }
        return envoiList ;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseWrapper<EnvoiModel>>updateEnvoi(EnvoiModel envoi, String id) async {
    final res = await sl<Dio>().patch(
      "/envoi/$id",
      data: envoi.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => EnvoiModel.fromJson(p0));
  }
}
