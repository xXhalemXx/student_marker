import 'package:flutter/material.dart';
import 'package:student_marker/core/welcome_screen/welcome_widgets/custom_paint.dart';
import 'package:student_marker/core/welcome_screen/welcome_widgets/hello_text.dart';
import 'package:student_marker/core/welcome_screen/welcome_widgets/student_id_form_field.dart';
import 'package:student_marker/core/welcome_screen/welcome_widgets/save_button.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final TextEditingController studentId = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff1AA7EC),
      body: Form(
        key: formKey,
        child: GestureDetector(
          onTap: () {
            gestureDetectorTap(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomPaintForLogin(),
              const HelloText(),
              NameFormField(
                studentId: studentId,
              ),
              SaveButton(
                studentId: studentId,
                formKey: formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
  gestureDetectorTap(BuildContext context) {
    FocusScopeNode currentFoucs=FocusScope.of(context);
    if(!currentFoucs.hasPrimaryFocus)
    {
      currentFoucs.unfocus();
    }
  }
}
