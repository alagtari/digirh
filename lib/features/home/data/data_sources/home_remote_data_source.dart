// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:digirh/core/common_used/response_wrapper.dart';
// import 'package:digirh/core/injection/injection_container.dart';
// import 'package:digirh/features/home/data/models/home_model.dart';

// abstract class HomeOnlineDataSource {
//   Future<ResponseWrapper<List<HomeModel>>> getHomes();
//   Future<ResponseWrapper<HomeModel>> addHome(HomeModel home);
//   Future<ResponseWrapper<HomeModel>> updateHome(HomeModel home, String id);
//   Future<Unit> deleteHome(String id);
// }

// class HomeOnlineDataSourceImpl implements HomeOnlineDataSource {
//   @override
//   Future<ResponseWrapper<HomeModel>> addHome(HomeModel home) async {
//     final res = await sl<Dio>().post(
//       "/home",
//       data: home.toJson(),
//     );
//     return ResponseWrapper.fromJson(res.data, (p0) => HomeModel.fromJson(p0));
//   }

//   @override
//   Future<Unit> deleteHome(String id) async {
//     await sl<Dio>().delete(
//       "/home/$id",
//     );
//     return unit;
//   }

//   @override
//   Future<ResponseWrapper<List<HomeModel>>> getHomes() async {
//     final res = await sl<Dio>().get(
//       "/home",
//     );
//     try {
//       return ResponseWrapper.fromJson(res.data, (p0) {
//         List<HomeModel> homeList = [];
//         for (var home in p0 as List) {
//           homeList.add(HomeModel.fromJson(home));
//         }
//         return homeList ;
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<ResponseWrapper<HomeModel>>updateHome(HomeModel home, String id) async {
//     final res = await sl<Dio>().patch(
//       "/home/$id",
//       data: home.toJson(),
//     );
//     return ResponseWrapper.fromJson(res.data, (p0) => HomeModel.fromJson(p0));
//   }
// }
