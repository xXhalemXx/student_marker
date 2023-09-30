import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:student_marker/core/genral_use/constants.dart';
import 'package:student_marker/core/injection/injection_model.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_cubit.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/permisson_granted_widgets/permission_granted_button.dart';
class StopConnectionButton extends StatelessWidget {
  const StopConnectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () async {
           Nearby().stopAllEndpoints();
           Nearby().stopDiscovery();
           PermissionGrantedButton.availableCourses=[];
           getIt<ConnectionCubit>().refreshStates();
        },
        backgroundColor: Colors.red,
        tooltip: AllTexts.stopButton,
        child: const Icon(Icons.power_settings_new_outlined));
  }
}
