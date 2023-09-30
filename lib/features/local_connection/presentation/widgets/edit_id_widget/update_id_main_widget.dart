import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_marker/core/data_source/genral_var.dart';
import 'package:student_marker/core/injection/injection_model.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/edit_id_widget/text_field_update_id.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/edit_id_widget/update_button_widget.dart';

class UpdateIdWidget extends StatelessWidget {
  final TextEditingController newStudentId = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String useId='';

  UpdateIdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundColor(),
      child: GestureDetector(
        //to make keyboard disappear when press in any place on screen
        onTap: () {
          gestureDetectorTap(context);
        },
        child: Center(
          child: addCourseForm(context),
        ),
      ),
    );
  }

  Widget addCourseForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
          ),
          backGroundPicture(context),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          UpdateIdFiled(newStudentId: newStudentId),
          const SizedBox(height: 10),
          //Sized Box Contain add button
          UpdateIdButton(
            newStudentId: newStudentId,
            formKey: formKey,
          ),
        ],
      ),
    );
  }

  BoxDecoration backGroundColor() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff4489fe),
          Color(0xff81b0fe),
          Color(0xffe3ecfa),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    );
  }

  Widget backGroundPicture(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: const Color(0xff4489fe),
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: backgroundIcon(context),
            ),
            Expanded(
              flex: 3,
              child: backgroundValue(context),
            )
          ],
        ),
      ),
    );
  }

  Widget backgroundIcon(BuildContext context) {
    return Icon(
      Icons.person,
      color: const Color(0xffffffff),
      size: MediaQuery.of(context).size.width * 0.45,
    );
  }
  Widget backgroundValue(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 45),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          AutoSizeText(
          'ID:${getIt<StudentInfo>().studentId}',
          style: const TextStyle(color: Color(0xffffffff)),
          maxLines: 1,
        ),
          SizedBox(height: MediaQuery.of(context).size.height*0.015),
          squares(context, 0.4, const Color(0xff81b0fe)),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          squares(context, 0.4, const Color(0xff81b0fe)),

        ],),
    );
  }

  Widget squares(BuildContext context,double ratio,Color color){
    return Container(
      width: MediaQuery.of(context).size.width*ratio,
      height: 20,
      decoration: BoxDecoration(
      color: color
    ),);
  }

  gestureDetectorTap(BuildContext context) {
    FocusScopeNode currentFoucs = FocusScope.of(context);
    if (!currentFoucs.hasPrimaryFocus) {
      currentFoucs.unfocus();
    }
  }
}
