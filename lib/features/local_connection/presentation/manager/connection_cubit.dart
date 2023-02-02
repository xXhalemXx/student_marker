import 'package:bloc/bloc.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionStates> {
  ConnectionCubit() : super(const InitState());

  checkPermissions() async {
    if (await Nearby().checkLocationPermission() &&
        await Nearby().checkBluetoothPermission()&&
        await Nearby().checkLocationEnabled()) {
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



}
