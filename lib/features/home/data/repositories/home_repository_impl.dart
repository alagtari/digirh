// import 'dart:developer';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:digirh/core/common_used/response_wrapper.dart';
// import 'package:digirh/core/errors/exceptions.dart';
// import 'package:digirh/core/errors/failures.dart';
// import 'package:digirh/features/home/data/data_sources/home_remote_data_source.dart';
// import 'package:digirh/features/home/data/models/home_model.dart';
// import 'package:digirh/features/home/domain/repositories/home_repository.dart';

// class HomeRepositoryImpl implements HomeRepository {
//   final HomeOnlineDataSource dataSource;

//   HomeRepositoryImpl({
//     required this.dataSource,
//   });

//   @override
//   Future<Either<AppFailure, ResponseWrapper<HomeModel>>> addHome(HomeModel request) async {
//     try {
//       final res = await dataSource.addHome(request);
//       log(res.toString());
//       return right(res);
//     } on AppException catch (e) {
//       return Left(AppFailure(message: e.message));
//     } on DioException catch (e) {
//       return Left(
//         AppFailure(message: e.response?.data?["message"]),
//       );
//     } catch (e) {
//       return Left(
//         AppFailure(message: 'Unexpected error occurred.'),
//       );
//     }
//   }

//   @override
//   Future<Either<AppFailure, Unit>> deleteHome(String id) async {
//     try {
//       final res = await dataSource.deleteHome(id);
//       log(res.toString());
//       return right(res);
//     } on AppException catch (e) {
//       return Left(AppFailure(message: e.message));
//     } on DioException catch (e) {
//       return Left(
//         AppFailure(message: e.response?.data?["message"]),
//       );
//     } catch (e) {
//       return Left(
//         AppFailure(message: 'Unexpected error occurred.'),
//       );
//     }
//   }

//   @override
//   Future<Either<AppFailure, ResponseWrapper<List<HomeModel>>>>
//       getHomes() async {
//     try {
//       final res = await dataSource.getHomes();
//       log(res.toString());
//       return right(res);
//     } on AppException catch (e) {
//       return Left(AppFailure(message: e.message));
//     } on DioException catch (e) {
//       return Left(
//         AppFailure(message: e.response?.data?["message"]),
//       );
//     } catch (e) {
//       return Left(
//         AppFailure(message: 'Unexpected error occurred.'),
//       );
//     }
//   }

//   @override
//   Future<Either<AppFailure, ResponseWrapper<HomeModel>>> updateHome(
//       HomeModel request, String id) async {
//     try {
//       final res = await dataSource.updateHome(request, id);
//       log(res.toString());
//       return right(res);
//     } on AppException catch (e) {
//       return Left(AppFailure(message: e.message));
//     } on DioException catch (e) {
//       return Left(
//         AppFailure(message: e.response?.data?["message"]),
//       );
//     } catch (e) {
//       return Left(
//         AppFailure(message: 'Unexpected error occurred.'),
//       );
//     }
//   }
// }
