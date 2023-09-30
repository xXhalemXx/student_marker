import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_state.freezed.dart';

@freezed
class ConnectionStates with _$ConnectionStates {

  const factory ConnectionStates.initState() = InitState;
  const factory ConnectionStates.noPermissionsGranted() = NoPermissionsGranted;
  const factory ConnectionStates.permissionsGranted() = PermissionsGranted;
  const factory ConnectionStates.activeScan(List<Map<String,String>> availableCourses) = ActiveScan;
  const factory ConnectionStates.wanting() = Wanting;

}