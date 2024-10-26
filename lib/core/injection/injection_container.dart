import 'package:digirh/features/conge/data/data_sources/conge_remote_data_source.dart';
import 'package:digirh/features/conge/data/repositories/conge_repository_impl.dart';
import 'package:digirh/features/conge/domain/repositories/conge_repository.dart';
import 'package:dio/dio.dart';
import 'package:digirh/core/common_used/app_prefs.dart';
import 'package:digirh/core/common_used/dio_provider.dart';
import 'package:digirh/features/auth/data/data_sources/remote_data_source.dart';
import 'package:digirh/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:digirh/features/auth/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:digirh/core/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton<AppPrefs>(
    () => AppPrefs(prefs),
  );
  sl.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );

  sl.registerLazySingleton<Dio>(
    () => DioProvider.instance(),
  );

  sl.registerLazySingleton<AuthOnlineDataSource>(
    () => AuthOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      dataSource: sl(),
    ),
  );

    sl.registerLazySingleton<CongeOnlineDataSource>(
    () => CongeOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<CongeRepository>(
    () => CongeRepositoryImpl(
      dataSource: sl(),
    ),
  );
}
