import 'package:device_information/device_information.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/core/data_source/cache_data.dart';
import 'package:student_marker/core/injection/injection_model.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_cubit.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/permisson_granted_widgets/permission_granted_button.dart';

Future<bool> startDiscovery(String userName,Strategy strategy) async {

  bool value = false;
  try {
    value = await Nearby().startDiscovery(
      userName,
      strategy,
      onEndpointFound: (id, name, serviceId) {
        bool found = false;
        for (var element in PermissionGrantedButton.availableCourses) {
          element.forEach((key, value) {
            if (value == name) {
              found = true;
            }
          });
        }
        if (!found) {
          PermissionGrantedButton.availableCourses.add({id: name});
          getIt<ConnectionCubit>().reloadActiveCourses(PermissionGrantedButton.availableCourses);
        }
      },
      onEndpointLost: (id) {
        for (var course in PermissionGrantedButton.availableCourses) {
          course.forEach((key, value) {
            if (key == id) {
              PermissionGrantedButton.availableCourses.remove(course);
              getIt<ConnectionCubit>().reloadActiveCourses(PermissionGrantedButton.availableCourses);
            }
          });
        }
      },
    );
  } catch (e) {
    //todo catch
  }
  return value;
}
