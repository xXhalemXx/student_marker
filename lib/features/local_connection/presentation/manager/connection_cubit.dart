import 'package:bloc/bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionStates> {
  ConnectionCubit() : super(const InitState());

  checkPermissions() async {

    if (await Permission.location.isGranted  &&
        await Permission.bluetooth.isGranted &&
        await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      emit(const PermissionsGranted());
    }else{
      emit(const NoPermissionsGranted());
    }
  }

  startScan(List<Map<String,String>> availableCourses){
    emit(ActiveScan(availableCourses));
  }
  reloadActiveCourses(List<Map<String,String>> availableCourses){
    emit(const InitState());
    emit(ActiveScan(availableCourses));
  }

  waitToCreate(){
    emit(const Wanting());
  }

  refreshStates() {
    emit(const Wanting());
    checkPermissions();

  }


}
