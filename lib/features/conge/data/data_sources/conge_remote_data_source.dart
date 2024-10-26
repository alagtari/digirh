import 'package:dartz/dartz.dart';
import 'package:digirh/features/conge/data/models/supervisor_conge_model.dart';
import 'package:digirh/features/conge/data/models/supervisor_model.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/common_used/response_wrapper.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/conge/data/models/conge_model.dart';

abstract class CongeOnlineDataSource {
  Future<ResponseWrapper<List<LeaveModel>>> getConges();
  Future<ResponseWrapper<List<SupervisorLeaveModel>>> getSupervisorConges();
  Future<ResponseWrapper<List<SupervisorModel>>> getCongeSupervisors(
      String congeId);
  Future<ResponseWrapper<LeaveModel>> addConge(LeaveModel conge);
  Future<Unit> submitConge(String congeId);
  Future<Unit> acceptConge(String congeId);
  Future<Unit> rejectConge(String congeId);
  Future<Unit> updateConge(LeaveModel conge, String id);
  Future<Unit> deleteConge(String id);
}

class CongeOnlineDataSourceImpl implements CongeOnlineDataSource {
  @override
  Future<ResponseWrapper<LeaveModel>> addConge(LeaveModel conge) async {
    final response = await sl<Dio>().post(
      "/conge-service",
      data: conge.toJson(),
    );

    return ResponseWrapper.fromJson(
      response.data,
      (p0) => LeaveModel.fromJson(p0),
    );
  }

  @override
  Future<ResponseWrapper<List<SupervisorModel>>> getCongeSupervisors(
      String congeId) async {
    final response = await sl<Dio>().get(
      "/conge-service/supervisors/$congeId",
    );

    return ResponseWrapper.fromJson(response.data, (p0) {
      List<SupervisorModel> supervisorList = [];
      for (var supervisor in p0 as List) {
        supervisorList.add(SupervisorModel.fromJson(supervisor));
      }
      return supervisorList;
    });
  }

  @override
  Future<ResponseWrapper<List<SupervisorLeaveModel>>>
      getSupervisorConges() async {
    final response = await sl<Dio>().get(
      "/conge-service/bysupervisor",
    );

    return ResponseWrapper.fromJson(response.data, (p0) {
      List<SupervisorLeaveModel> supervisorList = [];
      for (var supervisor in p0 as List) {
        supervisorList.add(SupervisorLeaveModel.fromJson(supervisor));
      }
      return supervisorList;
    });
  }

  @override
  Future<Unit> deleteConge(String id) async {
    await sl<Dio>().delete(
      "/conge-service/$id",
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<List<LeaveModel>>> getConges() async {
    final res = await sl<Dio>().get(
      "/conge-service",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<LeaveModel> congeList = [];
        for (var conge in p0 as List) {
          congeList.add(LeaveModel.fromJson(conge));
        }
        return congeList;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> updateConge(LeaveModel conge, String id) async {
    await sl<Dio>().put(
      "/conge-service/$id",
      data: conge.toJson(),
    );
    return unit;
  }

  @override
  Future<Unit> submitConge(String congeId) async {
    await sl<Dio>().put(
      "/conge-service/submit",
      data: {"leaveId": congeId},
    );
    return unit;
  }

  @override
  Future<Unit> acceptConge(String congeId) async {
    await sl<Dio>().put(
      "/conge-service/accept/$congeId",
    );
    return unit;
  }

  @override
  Future<Unit> rejectConge(String congeId) async {
    await sl<Dio>().put(
      "/conge-service/reject/$congeId",
    );
    return unit;
  }
}
