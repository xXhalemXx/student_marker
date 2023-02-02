import 'package:get_it/get_it.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_cubit.dart';
final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<ConnectionCubit>(() => ConnectionCubit());
}