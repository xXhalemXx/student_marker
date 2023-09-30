import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/core/genral_use/constants.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/scan_widgets/active_courses_tail.dart';
class AllActiveCourses extends StatelessWidget {
  const AllActiveCourses({Key? key,required this.activatedCourses}) : super(key: key);

 final  List<Map<String,String>> activatedCourses;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: activatedCourses.isNotEmpty
                  ? allActiveCourses()
                  : noActiveCourses(context)),
         // stopButton(),
        ],
      ),
    );
  }
  ListView allActiveCourses() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: activatedCourses.length,
        itemBuilder: (_, index) {
          return ActiveCoursesTail(courseValue: activatedCourses[index],);
        });
  }

  Center noActiveCourses(BuildContext context) {
    return Center(
      child: Padding(
        padding:
        EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.17),
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.asset('assets/picture/no_active_courses.png')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.7,
              child:  const Text(
                AllTexts.noActiveCourses,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
