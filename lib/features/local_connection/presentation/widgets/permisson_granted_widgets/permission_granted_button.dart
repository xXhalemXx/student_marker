import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/core/injection/injection_model.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_cubit.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/permisson_granted_widgets/logic_for_permission_granted.dart';

class PermissionGrantedButton extends StatefulWidget {
  const PermissionGrantedButton({Key? key, required this.prefs}) : super(key: key);
  final SharedPreferences prefs;

  static List<Map<String, String>> availableCourses = [];

  @override
  State<PermissionGrantedButton> createState() => _PermissionGrantedButtonState();
}

class _PermissionGrantedButtonState extends State<PermissionGrantedButton> {
  final Strategy strategy = Strategy.P2P_POINT_TO_POINT;
  String userName = '';
  @override
  void initState() {
    userName =widget.prefs.getString('studentId')!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.5,
        child: RawMaterialButton(
          onPressed: () async {
            getIt<ConnectionCubit>().waitToCreate();
            if (await startDiscovery(userName,strategy,widget.prefs)) {
              getIt<ConnectionCubit>().startScan(PermissionGrantedButton.availableCourses);
            } else {
              getIt<ConnectionCubit>().checkPermissions();
            }
          },
          shape: const CircleBorder(),
          elevation: 3,
          fillColor: Colors.blue,
          child: Icon(
            Icons.wifi_find_sharp,
            color: Colors.white,
            size: MediaQuery.of(context).size.width * 0.33,
          ),
        ),
      ),
    );
  }

}
