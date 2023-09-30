import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/core/genral_use/constants.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/genral_widgets/genral_widgets.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/scan_widgets/all_active_courses.dart';
class ScanMainWidget extends StatelessWidget {
  const ScanMainWidget({Key? key,required this.availableCourses}) : super(key: key);
  final List<Map<String,String>> availableCourses;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const Expanded(
          flex: 1,
          child: ConnectionHeader(headerText: AllTexts.startScan,textColor: Colors.white,),
        ),
        Expanded(
          flex: 6,
          child: AllActiveCourses(activatedCourses: availableCourses,),
        )
      ],
    );
  }
}
