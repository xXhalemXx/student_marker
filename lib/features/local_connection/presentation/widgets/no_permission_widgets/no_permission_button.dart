import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:student_marker/core/injection/injection_model.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_cubit.dart';

class NoPermissionButton extends StatelessWidget {
  const NoPermissionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        width: MediaQuery.of(context).size.width * 0.6,
        child: RawMaterialButton(
          onPressed: ([bool mounted = true]) async {
            //location permission
            if (await Permission.location.isDenied ) {
              await Permission.location.request();
            }
            //Bluetooth Permission
            if (!await Permission.bluetooth.isDenied) {
              Permission.bluetooth.request();
            }
            //Location permission
            if (await Permission.locationWhenInUse.serviceStatus.isDisabled) {
              await Permission.locationWhenInUse.request();
            }
            if(!await Permission.phone.isDenied){
              await Permission.phone.request();
            }
            if (await Permission.speech.isPermanentlyDenied) {
              openAppSettings();
            }

            getIt<ConnectionCubit>().checkPermissions();
          },
          shape: const CircleBorder(),
          elevation: 3,
          fillColor: Colors.redAccent,
          child:  Icon(
            Icons.wifi_lock,
              color: Colors.white,
              size: MediaQuery.of(context).size.width*0.33,
          ),
        ),
      ),
    );
  }
}
