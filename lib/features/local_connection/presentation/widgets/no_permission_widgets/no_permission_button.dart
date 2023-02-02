import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';
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
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.5,
        child: RawMaterialButton(
          onPressed: ([bool mounted = true]) async {
            //location permission
            if (await Nearby().checkLocationPermission()) {
            } else {
              await Nearby().askLocationPermission();
            }
            //Bluetooth Permission
            if (await Nearby().checkBluetoothPermission()) {
            } else {
              Nearby().askBluetoothPermission();
            }
            //Location permission
            if (await Nearby().checkLocationEnabled()) {

            } else {
              await Nearby().enableLocationServices();
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
