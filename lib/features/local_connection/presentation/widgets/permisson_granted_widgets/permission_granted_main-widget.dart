import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/core/genral_use/constants.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/genral_widgets/genral_widgets.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/permisson_granted_widgets/edite_button.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/permisson_granted_widgets/permission_granted_button.dart';
class PermissionsGrantedMainWidget extends StatelessWidget {
  const PermissionsGrantedMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ConnectionHeader(headerText: AllTexts.permissionGranted,textColor: Colors.white,),
        SizedBox(height:MediaQuery.of(context).size.height*0.15,),
         const PermissionGrantedButton(),
         const EditeButton(),
      ],
    );
  }
}
