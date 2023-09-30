import 'package:get_it/get_it.dart';
import 'package:student_marker/core/data_source/cache_data.dart';
import 'package:student_marker/core/data_source/genral_var.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_cubit.dart';
final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<ConnectionCubit>(() => ConnectionCubit());
  getIt.registerLazySingleton<CacheData>(() => CacheData());
  getIt.registerLazySingleton<StudentInfo>(() => StudentInfo());
}