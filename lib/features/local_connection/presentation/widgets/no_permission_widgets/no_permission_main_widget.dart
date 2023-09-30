
import 'package:flutter/material.dart';
import 'package:student_marker/core/genral_use/constants.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/genral_widgets/genral_widgets.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/no_permission_widgets/no_permission_button.dart';

class NoPermissionMainWidget extends StatelessWidget {
  const NoPermissionMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ConnectionHeader(headerText: AllTexts.noPermissionHeader,textColor: Colors.white,),
        SizedBox(height:MediaQuery.of(context).size.height*0.15,),
        const NoPermissionButton()
      ],
    );
  }
}
